import 'package:flutter/material.dart';
import 'package:pref/pref.dart';

import 'package:squawker/client/client.dart';
import 'package:squawker/client/client_account.dart';
import 'package:squawker/constants.dart';
import 'package:squawker/profile/profile.dart';
import 'package:squawker/tweet/conversation.dart';
import 'package:squawker/ui/cursor_paging.dart';
import 'package:squawker/ui/errors.dart';
import 'package:squawker/user.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:squawker/utils/iterables.dart';

class ProfileTweets extends StatefulWidget {
  final UserWithExtra user;
  final String type;
  final bool includeReplies;
  final List<String> pinnedTweets;

  const ProfileTweets(
      {Key? key, required this.user, required this.type, required this.includeReplies, required this.pinnedTweets})
      : super(key: key);

  @override
  State<ProfileTweets> createState() => _ProfileTweetsState();
}

class _ProfileTweetsState extends State<ProfileTweets> with AutomaticKeepAliveClientMixin<ProfileTweets> {
  CursorPagingState<String?, TweetChain, String> _pagingState = CursorPagingState();

  static const int pageSize = 20;

  @override
  bool get wantKeepAlive => true;

  Future<void> _fetchNextPage() async {
    if (_pagingState.isLoading) {
      //print('*** _fetchNextPage _pagingState.isLoading'); // TODO remove
      return;
    }

    setState(() {
      _pagingState = _pagingState.copyWithEx(isLoading: true, error: null);
    });

    try {
      TweetStatus result;
      if (TwitterAccount.hasAccountAvailable()) {
        if (PrefService.of(context).get(optionEnhancedProfile)) {
          result = await Twitter.getUserWithProfileGraphql(widget.user.idStr!, widget.type, widget.pinnedTweets,
            cursor: _pagingState.cursor, count: pageSize, includeReplies: widget.includeReplies);
        }
        else {
          result = await Twitter.getTweets(widget.user.idStr!, widget.type, widget.pinnedTweets,
            cursor: _pagingState.cursor, count: pageSize, includeReplies: widget.includeReplies);
        }
      }
      else {
        result = await Twitter.getUserTweets(widget.user.idStr!, widget.type, widget.pinnedTweets,
          count: pageSize, includeReplies: widget.includeReplies);
      }
      print('*** _fetchNextPage with cursor=${_pagingState.cursor}, result.chains.length=${result.chains.length}, result.cursorBottom="${result.cursorBottom}", result.cursorTop="${result.cursorTop}"');

      if (!mounted) {
        print('*** _fetchNextPage !mounted');
        return;
      }

      List<TweetChain>? totLst = _pagingState.pages?.expand((elm) => elm).toList();
      List<TweetChain> resLst = result.chains.where((tc) => (totLst ?? []).firstWhereOrNull((tc2) => tc2.id == tc.id) == null).toList();
      //print('*** totLst.length=${totLst?.length ?? 0}, resLst.length=${resLst.length}'); // TODO remove
      bool hasNextPage = resLst.isNotEmpty;
      setState(() {
        _pagingState = _pagingState.copyWithEx(
          pages: [...?_pagingState.pages, resLst],
          keys: [...?_pagingState.keys, result.cursorBottom],
          hasNextPage: hasNextPage,
          cursor: result.cursorBottom,
          isLoading: false,
        );
      });

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
    super.build(context);
    TwitterAccount.setCurrentContext(context);

    return Consumer<TweetContextState>(builder: (context, model, child) {
      if (model.hideSensitive && (widget.user.possiblySensitive ?? false)) {
        return EmojiErrorWidget(
          emoji: '🍆🙈🍆',
          message: L10n.current.possibly_sensitive,
          errorMessage: L10n.current.possibly_sensitive_profile,
          onRetry: () async => model.setHideSensitive(false),
          retryText: L10n.current.yes_please,
        );
      }

      return RefreshIndicator(
        onRefresh: () async {
          setState(() {
            _pagingState = _pagingState.resetEx();
          });
          await _fetchNextPage();
        },
        child: PagedListView<String?, TweetChain>(
          padding: EdgeInsets.zero,
          addAutomaticKeepAlives: false,
          state: _pagingState,
          fetchNextPage: _fetchNextPage,
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (context, chain, index) {
              return TweetConversation(
                id: chain.id, tweets: chain.tweets, username: widget.user.screenName!, isPinned: chain.isPinned);
            },
            firstPageErrorIndicatorBuilder: (context) => FullPageErrorWidget(
              error: (_pagingState.error as List)[0],
              stackTrace: (_pagingState.error as List)[1],
              prefix: L10n.of(context).unable_to_load_the_tweets,
              onRetry: () => _fetchNextPage,
            ),
            newPageErrorIndicatorBuilder: (context) => FullPageErrorWidget(
              error: (_pagingState.error as List)[0],
              stackTrace: (_pagingState.error as List)[1],
              prefix: L10n.of(context).unable_to_load_the_next_page_of_tweets,
              onRetry: () =>_fetchNextPage,
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
      );
    });
  }
}
