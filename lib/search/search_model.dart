import 'package:flutter_triple/flutter_triple.dart';
import 'package:squawker/client.dart';
import 'package:squawker/user.dart';

class SearchTweetsModel extends Store<List<TweetWithCard>> {
  SearchTweetsModel() : super([]);

  Future<void> searchTweets(String query, bool enhanced) async {
    await execute(() async {
      if (query.isEmpty) {
        return [];
      } else {
        if (enhanced) {
          return (await Twitter.searchTweetsGraphql(query, true))
              .chains
              .map((e) => e.tweets)
              .expand((element) => element)
              .toList();
        }
        else {
          return (await Twitter.searchTweets(query, true))
              .chains
              .map((e) => e.tweets)
              .expand((element) => element)
              .toList();
        }
      }
    });
  }
}

class SearchUsersModel extends Store<List<UserWithExtra>> {
  SearchUsersModel() : super([]);

  Future<void> searchUsers(String query, bool enhanced) async {
    await execute(() async {
      if (query.isEmpty) {
        return [];
      } else {
        if (enhanced) {
          return await Twitter.searchUsersGraphql(query);
        }
        else {
          return await Twitter.searchUsers(query);
        }
      }
    });
  }
}
