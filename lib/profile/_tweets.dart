import 'package:flutter/material.dart';
import 'package:pref/pref.dart';

import 'package:squawker/client.dart';
import 'package:squawker/constants.dart';
import 'package:squawker/profile/profile.dart';
import 'package:squawker/tweet/conversation.dart';
import 'package:squawker/ui/errors.dart';
import 'package:squawker/user.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:provider/provider.dart';

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
  late PagingController<String?, TweetChain> _pagingController;

  static const int pageSize = 20;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _pagingController = PagingController(firstPageKey: null);
    _pagingController.addPageRequestListener((cursor) {
      _loadTweets(cursor);
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future _loadTweets(String? cursor) async {
    try {
      TweetStatus result;
      if (PrefService.of(context).get(optionEnhancedProfile)) {
        result = await Twitter.getUserWithProfileGraphql(widget.user.idStr!, widget.type, widget.pinnedTweets,
            cursor: cursor, count: pageSize, includeReplies: widget.includeReplies);
      }
      else {
        result = await Twitter.getTweets(widget.user.idStr!, widget.type, widget.pinnedTweets,
            cursor: cursor, count: pageSize, includeReplies: widget.includeReplies);
      }

      if (!mounted) {
        return;
      }

      if (result.cursorBottom == _pagingController.nextPageKey) {
        _pagingController.appendLastPage([]);
      } else {
        _pagingController.appendPage(result.chains, result.cursorBottom);
      }
    } catch (e, stackTrace) {
      if (mounted) {
        _pagingController.error = [e, stackTrace];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

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
        onRefresh: () async => _pagingController.refresh(),
        child: PagedListView<String?, TweetChain>(
          padding: EdgeInsets.zero,
          pagingController: _pagingController,
          addAutomaticKeepAlives: false,
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (context, chain, index) {
              return TweetConversation(
                  id: chain.id, tweets: chain.tweets, username: widget.user.screenName!, isPinned: chain.isPinned);
            },
            firstPageErrorIndicatorBuilder: (context) => FullPageErrorWidget(
              error: _pagingController.error[0],
              stackTrace: _pagingController.error[1],
              prefix: L10n.of(context).unable_to_load_the_tweets,
              onRetry: () => _loadTweets(_pagingController.firstPageKey),
            ),
            newPageErrorIndicatorBuilder: (context) => FullPageErrorWidget(
              error: _pagingController.error[0],
              stackTrace: _pagingController.error[1],
              prefix: L10n.of(context).unable_to_load_the_next_page_of_tweets,
              onRetry: () => _loadTweets(_pagingController.nextPageKey),
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
