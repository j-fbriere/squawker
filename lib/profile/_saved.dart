import 'package:flutter/material.dart';
import 'package:squawker/database/entities.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:squawker/home/_favorites.dart';
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
  late final PagingController<int?, SavedTweet> _pagingController;

  @override
  void initState() {
    super.initState();

    _pagingController = PagingController(firstPageKey: null);
    _pagingController.addPageRequestListener((cursor) {
      _loadTweets();
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _loadTweets() async {
    var model = context.read<SavedTweetModel>();
    await model.listSavedTweets();

    var savedTweets = model.state.where((tweet) => tweet.user == widget.user.idStr).toList();
    _pagingController.appendLastPage(savedTweets);
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
        pagingController: _pagingController,
        addAutomaticKeepAlives: false,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (context, savedTweet, index) => SavedTweetTile(id: savedTweet.id, content: savedTweet.content),
          firstPageErrorIndicatorBuilder: (context) => FullPageErrorWidget(
            error: _pagingController.error[0],
            stackTrace: _pagingController.error[1],
            prefix: L10n.of(context).unable_to_load_the_tweets,
            onRetry: () => _loadTweets(),
          ),
          newPageErrorIndicatorBuilder: (context) => FullPageErrorWidget(
            error: _pagingController.error[0],
            stackTrace: _pagingController.error[1],
            prefix: L10n.of(context).unable_to_load_the_next_page_of_tweets,
            onRetry: () => _loadTweets(),
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
