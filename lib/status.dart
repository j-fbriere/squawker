import 'package:flutter/material.dart';
import 'package:squawker/client/client.dart';
import 'package:squawker/client/client_account.dart';
import 'package:squawker/constants.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:squawker/profile/profile.dart';
import 'package:squawker/tweet/conversation.dart';
import 'package:squawker/ui/errors.dart';
import 'package:squawker/ui/cursor_paging.dart';
import 'package:squawker/utils/route_util.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pref/pref.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class StatusScreenArguments {
  final String id;
  final String? username;

  StatusScreenArguments({required this.id, required this.username});

  @override
  String toString() {
    return 'StatusScreenArguments{id: $id, username: $username}';
  }
}

class StatusScreen extends StatelessWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = getNamedRouteArguments(routeStatus) as StatusScreenArguments;

    return _StatusScreen(username: args.username, id: args.id);
  }
}

class _StatusScreen extends StatefulWidget {
  final String? username;
  final String id;

  const _StatusScreen({Key? key, required this.username, required this.id}) : super(key: key);

  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<_StatusScreen> {
  CursorPagingState<String?, TweetChain, String> _pagingState = CursorPagingState();
  final _scrollController = AutoScrollController();

  final _seenAlready = <String>{};

  Future<void> _fetchNextPage() async {
    if (_pagingState.isLoading) return;

    setState(() {
      _pagingState = _pagingState.copyWithEx(isLoading: true, error: null);
    });

    try {
      var isFirstPage = _pagingState.cursor == null;

      var result = await Twitter.getTweet(widget.id, cursor: _pagingState.cursor);

      if (!mounted) {
        return;
      }

      // Twitter sometimes sends the original replies with all pages, so we need to manually exclude ones that we've already seen
      var chains = result.chains.skipWhile((element) => _seenAlready.contains(element.id)).toList();

      for (var chain in chains) {
        _seenAlready.add(chain.id);
      }

      bool hasNextPage = result.chains.isNotEmpty;
      setState(() {
        _pagingState = _pagingState.copyWithEx(
          pages: [...?_pagingState.pages, chains],
          keys: [...?_pagingState.keys, result.cursorBottom],
          hasNextPage: hasNextPage,
          isLoading: false,
        );
      });

      // If we're on the first page, we want to scroll to the selected status
      if (isFirstPage) {
        var statusIndex = chains.indexWhere((e) => e.id == widget.id);

        await _scrollController.scrollToIndex(statusIndex, preferPosition: AutoScrollPosition.begin);
        await _scrollController.highlight(statusIndex);
      }
    }
    catch (err, stk) {
      if (mounted) {
        setState(() {
          _pagingState = _pagingState.copyWithEx(
            error: [err, stk],
            isLoading: false,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    TwitterAccount.setCurrentContext(context);
    return Scaffold(
      appBar: AppBar(),
      body: ChangeNotifierProvider<TweetContextState>(
        create: (context) => TweetContextState(PrefService.of(context, listen: false).get(optionTweetsHideSensitive)),
        child: PagedListView<String?, TweetChain>(
          padding: EdgeInsets.zero,
          scrollController: _scrollController,
          addAutomaticKeepAlives: false,
          shrinkWrap: true,
          state: _pagingState,
          fetchNextPage: _fetchNextPage,
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (context, chain, index) {
              return AutoScrollTag(
                key: ValueKey(chain.id),
                controller: _scrollController,
                index: index,
                highlightColor: Colors.white.withOpacity(1),
                child: TweetConversation(id: chain.id, tweets: chain.tweets, username: null, isPinned: chain.isPinned),
              );
            },
            firstPageErrorIndicatorBuilder: (context) => FullPageErrorWidget(
              error: (_pagingState.error as List)[0],
              stackTrace: (_pagingState.error as List)[1],
              prefix: L10n.of(context).unable_to_load_the_tweet,
              onRetry: () => _fetchNextPage,
            ),
            newPageErrorIndicatorBuilder: (context) => FullPageErrorWidget(
              error: (_pagingState.error as List)[0],
              stackTrace: (_pagingState.error as List)[1],
              prefix: L10n.of(context).unable_to_load_the_next_page_of_replies,
              onRetry: () => _fetchNextPage,
            ),
            noItemsFoundIndicatorBuilder: (context) {
              return Center(
                child: Text(
                  L10n.of(context).could_not_find_any_tweets_by_this_user,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
