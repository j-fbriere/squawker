import 'package:flutter/material.dart';
import 'package:squawker/database/entities.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:squawker/home/_saved.dart';
import 'package:squawker/profile/profile.dart';
import 'package:squawker/saved/saved_tweet_model.dart';
import 'package:squawker/ui/errors.dart';
import 'package:squawker/user.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class ProfileSaved extends StatefulWidget {
  final UserWithExtra user;

  const ProfileSaved({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfileSaved> createState() => _ProfileSavedState();
}

class _ProfileSavedState extends State<ProfileSaved> {
  PagingState<int?, SavedTweet> _pagingState = PagingState();

  Future<void> _fetchNextPage() async {
    if (_pagingState.isLoading) return;

    setState(() {
      _pagingState = _pagingState.copyWith(isLoading: true, error: null);
    });

    try {
      var model = context.read<SavedTweetModel>();
      await model.listSavedTweets();

      if (!mounted) {
        return;
      }

      var savedTweets = model.state.where((tweet) => tweet.user == widget.user.idStr).toList();
      var newKey = (_pagingState.keys?.last ?? 0) + 1;
      var isLastPage = savedTweets.isEmpty;

      setState(() {
        _pagingState = _pagingState.copyWith(
          pages: [...?_pagingState.pages, savedTweets],
          keys: [...?_pagingState.keys, newKey],
          hasNextPage: !isLastPage,
          isLoading: false,
        );
      });
    }
    catch (err, stk) {
      if (mounted) {
        setState(() {
          _pagingState = _pagingState.copyWith(
            error: [err, stk],
            isLoading: false,
          );
        });
      }
    }

  }

  @override
  Widget build(BuildContext context) {
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

      return PagedListView<int?, SavedTweet>(
        padding: EdgeInsets.zero,
        addAutomaticKeepAlives: false,
        state: _pagingState,
        fetchNextPage: _fetchNextPage,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (context, savedTweet, index) => SavedTweetTile(id: savedTweet.id, content: savedTweet.content),
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
            onRetry: () => _fetchNextPage,
          ),
          noItemsFoundIndicatorBuilder: (context) {
            return Center(
              child: Text(
                L10n.of(context).you_have_not_saved_any_tweets_yet,
              ),
            );
          },
        ),
      );
    });
  }
}
