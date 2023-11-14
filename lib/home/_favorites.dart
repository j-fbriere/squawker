import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'package:squawker/client.dart';
import 'package:squawker/constants.dart';
import 'package:squawker/database/entities.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:squawker/home/home_screen.dart';
import 'package:squawker/profile/profile.dart';
import 'package:squawker/saved/saved_tweet_model.dart';
import 'package:squawker/tweet/tweet.dart';
import 'package:squawker/ui/errors.dart';
import 'package:pref/pref.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget {
  final ScrollController scrollController;

  const FavoritesScreen({Key? key, required this.scrollController}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> with AutomaticKeepAliveClientMixin<FavoritesScreen> {
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
    var model = context.read<SavedTweetModel>();

    var prefs = PrefService.of(context, listen: false);

    return NestedScrollView(
      controller: widget.scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            pinned: false,
            snap: true,
            floating: true,
            title: Text(L10n.of(context).favorites),
            actions: createCommonAppBarActions(context),
          )
        ];
      },
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider<TweetContextState>(
              create: (_) => TweetContextState(prefs.get(optionTweetsHideSensitive))),
        ],
        child: ScopedBuilder<SavedTweetModel, List<SavedTweet>>.transition(
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

            return ListView.builder(
              controller: widget.scrollController,
              padding: const EdgeInsets.only(top: 4),
              itemCount: data.length,
              itemBuilder: (context, index) {
                var item = data[index];
                return SavedTweetTile(id: item.id, content: item.content);
              },
            );
          },
        ),
      ),
    );
  }
}

class SavedTweetTile extends StatelessWidget {
  final String id;
  final String? content;

  const SavedTweetTile({Key? key, required this.id, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var content = this.content;
    if (content == null) {
      // The tweet is probably too big to fit inside the cursor and has been removed from the result set
      return SavedTweetTooLarge(id: id);
    }

    var tweet = TweetWithCard.fromJson(jsonDecode(content));

    return TweetTile(key: Key(tweet.idStr!), tweet: tweet, clickable: true);
  }
}

class SavedTweetTooLarge extends StatelessWidget {
  final String id;

  const SavedTweetTooLarge({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.error_rounded, color: Colors.red),
              title: Text(L10n.current.oops_something_went_wrong),
              subtitle: Text(L10n.current.saved_tweet_too_large),
            ),
          ],
        ),
      ),
    );
  }
}

class SavedTweetTooLargeException implements Exception {
  final String id;

  SavedTweetTooLargeException(this.id);

  @override
  String toString() {
    return 'The saved tweet with the ID $id was too large';
  }
}
