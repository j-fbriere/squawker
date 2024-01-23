import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart';
import 'package:logging/logging.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:squawker/client.dart';
import 'package:squawker/client_account.dart';
import 'package:squawker/constants.dart';
import 'package:squawker/database/entities.dart';
import 'package:squawker/database/repository.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:squawker/group/group_screen.dart';
import 'package:squawker/profile/profile.dart';
import 'package:squawker/tweet/_video.dart';
import 'package:squawker/tweet/conversation.dart';
import 'package:squawker/tweet/tweet.dart';
import 'package:squawker/ui/errors.dart';
import 'package:squawker/utils/iterables.dart';
import 'package:pref/pref.dart';
import 'package:provider/provider.dart';
import 'package:synchronized/synchronized.dart';

class SubscriptionGroupFeed extends StatefulWidget {
  final SubscriptionGroupGet group;
  final List<SubscriptionGroupFeedChunk> chunks;
  final bool includeReplies;
  final bool includeRetweets;
  final ItemScrollController? scrollController;

  const SubscriptionGroupFeed(
      {Key? key,
      required this.group,
      required this.chunks,
      required this.includeReplies,
      required this.includeRetweets,
      required this.scrollController})
      : super(key: key);

  @override
  State<SubscriptionGroupFeed> createState() => SubscriptionGroupFeedState();
}

class SubscriptionGroupFeedState extends State<SubscriptionGroupFeed> with WidgetsBindingObserver {

  static final log = Logger('SubscriptionGroupFeedState');

  static final Lock _lock = Lock();

  GlobalKey _key = GlobalKey();

  late VisiblePositionState _visiblePositionState;
  late ItemPositionsListener _itemPositionsListener;
  bool _insertOffset = true;
  bool _keepFeedOffset = false;
  final List<TweetChain> _data = [];
  bool _toScroll = false;
  Response? _errorResponse;
  int? _positionShowing;
  OverlayEntry? _overlayEntry;
  final Map<String,int> _tweetIdxDic = {};

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    _visiblePositionState = VisiblePositionState();
    _itemPositionsListener = ItemPositionsListener.create();
    _itemPositionsListener.itemPositions.addListener(() { _checkFetchData(); });
    Future.delayed(Duration.zero, () {
      _checkFetchData();
    });
  }

  @override
  void dispose() {
    _updateOffset();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused || state == AppLifecycleState.detached) {
      _updateOffset();
    }
  }

  @override
  Future<AppExitResponse> didRequestAppExit() async {
    _updateOffset();
    return super.didRequestAppExit();
  }

  Future<void> _checkFetchData() async {
    if (_data.isEmpty || (_data.length - _itemPositionsListener.itemPositions.value.first.index) < 20) {
      await _lock.synchronized(() async {
        if (_data.isEmpty || (_data.length - _itemPositionsListener.itemPositions.value.first.index) < 20) {
          await _listTweets();
        }
      });
    }
  }

  Future<void> _updateOffset() async {
    try {
      if (_keepFeedOffset && _visiblePositionState.initialized && _visiblePositionState.visibleChainId != null) {
        if (kDebugMode) {
          print('*** _SubscriptionGroupFeedState._updateOffset - widget.group.id=${widget.group.id}, visibleChainId=${_visiblePositionState.visibleChainId}, visibleTweetId=${_visiblePositionState.visibleTweetId}, insert=$_insertOffset');
        }
        var repository = await Repository.writable();
        if (_insertOffset) {
          await repository.insert(tableFeedGroupPositionState, {'group_id': widget.group.id, 'chain_id': _visiblePositionState.visibleChainId, 'tweet_id': _visiblePositionState.visibleTweetId});
        }
        else {
          await repository.update(tableFeedGroupPositionState, {'chain_id': _visiblePositionState.visibleChainId, 'tweet_id': _visiblePositionState.visibleTweetId}, where: 'group_id = ?', whereArgs: [widget.group.id]);
        }
      }
    }
    catch (e, stackTrace) {
      log.warning('*** ERROR _updateOffset');
      log.warning(e);
      log.warning(stackTrace);
    }
  }

  void _resetData() {
    _visiblePositionState.initialized = false;
    _data.clear();
  }

  Future<void> reloadData() async {
    await _updateOffset();
    _resetData();
    _checkFetchData();
  }

  @override
  void didUpdateWidget(SubscriptionGroupFeed oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.includeReplies != widget.includeReplies || oldWidget.includeRetweets != widget.includeRetweets) {
      reloadData();
    }
  }

  String _buildSearchQuery(List<Subscription> users) {
    var query = '';
    if (!widget.includeReplies) {
      query += '-filter:replies AND ';
    }

    if (!widget.includeRetweets) {
      query += '-filter:retweets AND ';
    } else {
      query += 'include:nativeretweets AND ';
    }

    var remainingLength = 512 - query.length;

    int cnt = 0;
    for (var user in users) {
      var queryToAdd = '';
      if (user is UserSubscription) {
        queryToAdd = 'from:${user.screenName}';
      } else if (user is SearchSubscription) {
        queryToAdd = '"${user.id}"';
      }

      // If we can add this user to the query and still be less than ~512 characters, do so
      if (query.length + queryToAdd.length < remainingLength) {
        if (cnt > 0) {
          query += ' OR ';
        }

        query += queryToAdd;
      } else {
        // Otherwise, add the search future and start a new one
        assert(false, 'should never reach here');
        query = queryToAdd;
      }
      cnt++;
    }

    return query;
  }

  /// Search for our next "page" of tweets.
  ///
  /// Here, each page is actually a set of mappings, where the ID of each set is the hash of all the user IDs in that
  /// set. We store this along with the top and bottom pagination cursors, which we use to perform pagination for all
  /// sets at the same time, allowing us to create a feed made up of individual search queries.
  Future _listTweets() async {
    try {
      List<Future<List<TweetChain>>> futures = [];

      var repository = await Repository.writable();

      BasePrefService prefs = PrefService.of(context);
      _keepFeedOffset = prefs.get(optionKeepFeedOffset);

      String? positionedChainId;
      String? positionedTweetId;
      if (_keepFeedOffset) {
        var positionStateData = await repository.query(tableFeedGroupPositionState, where: 'group_id = ?', whereArgs: [widget.group.id]);
        _insertOffset = positionStateData.isEmpty;
        if (positionStateData.isNotEmpty) {
          positionedChainId = positionStateData[0]['chain_id'] as String?;
          positionedTweetId = positionStateData[0]['tweet_id'] as String?;
          if (kDebugMode) {
            print('*** _SubscriptionGroupFeedState._listTweets - repository.query - positionedChainId=$positionedChainId, positionedTweetId=$positionedTweetId');
          }
        }
      }

      _errorResponse = null;
      RateFetchContext fetchContext = RateFetchContext(prefs.get(optionEnhancedFeeds) ? Twitter.graphqlSearchTimelineUriPath : Twitter.searchTweetsUriPath, widget.chunks.length);
      await fetchContext.init();
      for (var chunk in widget.chunks) {
        var hash = chunk.hash;

        futures.add(Future(() async {
          var tweets = <TweetChain>[];

          String? searchCursor;
          String? cursorType;
          bool requestToDo = false;

          var storedChunks = await repository.query(tableFeedGroupChunk,
              where: 'group_id = ? AND hash = ?', whereArgs: [widget.group.id, hash], orderBy: 'created_at DESC');
          if (_data.isEmpty) {
            requestToDo = true;
            // Make sure we load any existing stored tweets from the chunk
            var storedChunksTweets = storedChunks
                .map((e) => jsonDecode(e['response'] as String))
                .map((e) => List.from(e))
                .expand((e) => e.map((c) => TweetChain.fromJson(c)))
                .toList();

            tweets.addAll(storedChunksTweets);

            // Use the latest chunk's top cursor to load any new tweets since the last time we checked
            var latestChunk = storedChunks.firstOrNull;
            if (latestChunk != null) {
              searchCursor = latestChunk['cursor_top'] as String;
              cursorType = 'cursor_top';
            } else {
              // Otherwise we need to perform a fresh load from scratch for this chunk
              searchCursor = null;
            }
          } else {
            // We're currently at the end of our current feed, so get the oldest chunk's bottom cursor to load older tweets.
            if (storedChunks.isNotEmpty) {
              requestToDo = true;
              searchCursor = storedChunks.last['cursor_bottom'] as String;
              cursorType = 'cursor_bottom';
            }
          }

          if (requestToDo) {
            // Perform our search for the next page of results for this chunk, and add those tweets to our collection
            var query = _buildSearchQuery(chunk.users);
            TweetStatus result;
            try {
              if (prefs.get(optionEnhancedFeeds)) {
                result = await Twitter.searchTweetsGraphql(query, widget.includeReplies, limit: 100,
                    cursor: searchCursor,
                    leanerFeeds: prefs.get(optionLeanerFeeds),
                    fetchContext: fetchContext);
              }
              else {
                result = await Twitter.searchTweets(query, widget.includeReplies, limit: 100,
                    cursor: searchCursor,
                    cursorType: cursorType,
                    leanerFeeds: prefs.get(optionLeanerFeeds),
                    fetchContext: fetchContext);
              }
            }
            catch (rsp) {
              if (rsp is Exception) {
                log.severe(rsp.toString());
              }
              _errorResponse = _errorResponse ?? (rsp is Exception ? ExceptionResponse(rsp) : rsp as Response);
              return tweets;
            }

            if (result.chains.isNotEmpty) {
              // avoid duplicates
              for (var cElm in result.chains) {
                if (tweets.firstWhereOrNull((tElm) => cElm.id == tElm.id) == null) {
                  tweets.add(cElm);
                }
              }

              // Make sure we insert the set of cursors for this latest chunk, ready for the next time we paginate
              await repository.insert(tableFeedGroupChunk, {
                'group_id': widget.group.id,
                'hash': hash,
                'cursor_top': result.cursorTop,
                'cursor_bottom': result.cursorBottom,
                'response': jsonEncode(result.chains.map((e) => e.toJson()).toList())
              });
            }
          }
          else {
            await fetchContext.fetchNoResponse();
          }

          return tweets;
        }));
      }

      // Wait for all our searches to complete, then build our list of tweet conversations
      var result = (await Future.wait(futures));
      var threads = result.expand((element) => element).sorted((a, b) {
        var aCreatedAt = a.tweets[0].createdAt;
        var bCreatedAt = b.tweets[0].createdAt;

        if (aCreatedAt == null || bCreatedAt == null) {
          return 0;
        }

        return bCreatedAt.compareTo(aCreatedAt);
      }).toList();

      if (!mounted) {
        return;
      }

      // this block is executed only at the first initialisation (or re-initialisation)
      if (positionedChainId != null && !_visiblePositionState.initialized) {
        int positionedChainIdx = threads.indexWhere((e) => e.id == positionedChainId);
        int positionedTweetIdx = -1;
        if (positionedChainIdx > -1 && positionedTweetId != null) {
          positionedTweetIdx = threads[positionedChainIdx].tweets.indexWhere((e) => e.idStr == positionedTweetId);
        }
        if (positionedChainIdx == -1) {
          // find the nearest conversation
          int refId = int.parse(positionedChainId);
          TweetChain tc = threads.lastWhere((e) {
            int id = int.parse(e.id);
            return id > refId;
          });
          positionedChainIdx = threads.indexWhere((e) => e.id == tc.id);
        }
        _visiblePositionState.scrollChainIdx = positionedChainIdx > -1 ? positionedChainIdx : null;
        _visiblePositionState.scrollTweetIdx = positionedTweetIdx > -1 ? positionedTweetIdx : null;
        if (kDebugMode) {
          print('*** _SubscriptionGroupFeedState._listTweets - setPositionIndexes - _visiblePositionState.scrollChainIdx=${_visiblePositionState.scrollChainIdx}, _visiblePositionState.scrollTweetIdx=${_visiblePositionState.scrollTweetIdx}');
        }
      }

      _positionShowing = null;

      setState(() {
        _data.addAll(threads);
      });

      _tweetIdxDic.clear();
      int idx = 0;
      for (var cElm in _data) {
        for (var tElm in cElm.tweets) {
          _tweetIdxDic[tElm.idStr!] = idx;
          idx++;
        }
      }

      _toScroll = false;
      if (threads.isNotEmpty && !_visiblePositionState.initialized && _visiblePositionState.scrollChainIdx != null) {
        _toScroll = true;
      }

    } catch (e, stackTrace) {
      if (e is Exception) {
        log.severe(e.toString());
        setState(() {
          _errorResponse ??= ExceptionResponse(e);
        });
      }
      if (mounted) {
        // probably something to do
      }
    }
  }

  void _showOverlay(BuildContext context) {
    //print('*** _showOverlay - _visiblePositionState.visibleChainIdx=${_visiblePositionState.visibleChainIdx}');
    if (_overlayEntry == null) {
      RenderBox renderBoxWindow = _key.currentContext!.findRenderObject() as RenderBox;
      Offset positionWindow = renderBoxWindow.localToGlobal(Offset.zero);
      _overlayEntry = OverlayEntry(builder: (context) {
        return Positioned(
          right: 5, // MediaQuery.of(context).size.width * 0.05,
          top: positionWindow.dy + 5, // MediaQuery.of(context).size.height * 0.15,
          child: Material(child: Text(_positionShowing == null ? '' : _positionShowing!.toString(), style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleMedium!.fontSize)))
        );
      });
      Overlay.of(context).insert(_overlayEntry!);
    }
    else {
      _overlayEntry!.markNeedsBuild();
    }
  }

  void _hideOverlay(BuildContext context) {
    //print('*** _hideOverlay - _visiblePositionState.visibleChainIdx=${_visiblePositionState.visibleChainIdx}');
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    BasePrefService prefs = PrefService.of(context, listen: false);
    _keepFeedOffset = prefs.get(optionKeepFeedOffset);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_toScroll) {
        _toScroll = false;
        if (kDebugMode) {
          print('*** _SubscriptionGroupFeedState._listTweets - scrollController.jumpTo - index=${_visiblePositionState.scrollChainIdx}, widget.group.id=${widget.group.id}');
        }
        widget.scrollController!.jumpTo(index: _visiblePositionState.scrollChainIdx!);
      }
      if (_errorResponse != null && _data.isNotEmpty && (_errorResponse!.statusCode < 200 || _errorResponse!.statusCode >= 300)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(_errorResponse!.body),
        ));
      }
    });

    if (_errorResponse != null && _data.isEmpty && (_errorResponse!.statusCode < 200 || _errorResponse!.statusCode >= 300)) {
      return Scaffold(
          body: FullPageErrorWidget(error: _errorResponse, prefix: 'Error request Twitter/X', stackTrace: null)
      );
    }

    if (widget.chunks.isEmpty) {
      return Scaffold(
        body: Center(
          child: Text(L10n.of(context).this_group_contains_no_subscriptions),
        ),
      );
    }

    return Scaffold(
      key: _key,
      body: RefreshIndicator(
        onRefresh: () async {
          await reloadData();
        },
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<TweetContextState>(
                create: (_) => TweetContextState(prefs.get(optionTweetsHideSensitive))),
            ChangeNotifierProvider<VideoContextState>(
                create: (_) => VideoContextState(prefs.get(optionMediaDefaultMute))),
          ],
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              if (!_keepFeedOffset || !_visiblePositionState.initialized) {
                return false;
              }
              if (notification is UserScrollNotification) {
                if (notification.direction == ScrollDirection.forward) {
                  if (_visiblePositionState.visibleTweetIdx != null) {
                    _positionShowing = _visiblePositionState.visibleTweetIdx!;
                    _showOverlay(context);
                  }
                }
                else if (notification.direction == ScrollDirection.idle) {
                  _positionShowing = null;
                  Future.delayed(const Duration(seconds: 2), () {
                    if (_positionShowing == null) {
                      _hideOverlay(context);
                    }
                  });
                }
              }
              return false;
            },
            child: ScrollablePositionedList.builder(
              itemCount: _data.length,
              itemBuilder: (context, index) {
                TweetChain tc = _data[index];
                return TweetConversation(key: ValueKey(tc.id), id: tc.id, username: null, isPinned: tc.isPinned, tweets: tc.tweets, tweetIdxDic: _tweetIdxDic, visiblePositionState: _visiblePositionState);
              },
              itemScrollController: widget.scrollController,
              itemPositionsListener: _itemPositionsListener,
              padding: const EdgeInsets.only(top: 4),
            ),
          ),
        ),
      ),
    );
  }
}
