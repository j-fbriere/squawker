import 'package:pref/pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:squawker/client/client_account.dart';
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

class _ProfileSavedState extends State<ProfileSaved> with AutomaticKeepAliveClientMixin<ProfileSaved> {

  final ScrollController scrollController = ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    context.read<SavedTweetModel>().listSavedTweets();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    TwitterAccount.setCurrentContext(context);
    var model = context.read<SavedTweetModel>();

    return ScopedBuilder<SavedTweetModel, List<SavedTweet>>.transition(
      store: model,
      onError: (_, e) => FullPageErrorWidget(
        error: e,
        stackTrace: null,
        prefix: L10n.current.unable_to_load_the_tweets,
        onRetry: () => model.listSavedTweets(),
      ),
      onLoading: (_) => const Center(child: CircularProgressIndicator()),
      onState: (_, data) {
        if (data.isEmpty) {
          return Center(child: Text(L10n.of(context).you_have_not_saved_any_tweets_yet));
        }
        var savedTweets = data.where((tweet) => tweet.user == widget.user.idStr).toList();
        return ListView.builder(
          controller: scrollController,
          padding: const EdgeInsets.only(top: 4),
          itemCount: savedTweets.length,
          itemBuilder: (context, index) {
            var item = savedTweets[index];
            return SavedTweetTile(id: item.id, content: item.content);
          },
        );
      },
    );
  }
}
