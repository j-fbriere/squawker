import 'dart:async';
import 'dart:convert';

import 'package:dart_twitter_api/src/utils/date_utils.dart';
import 'package:dart_twitter_api/twitter_api.dart';
import 'package:faker/faker.dart';
import 'package:ffcache/ffcache.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:squawker/profile/profile_model.dart';
import 'package:squawker/user.dart';
import 'package:squawker/utils/cache.dart';
import 'package:squawker/utils/iterables.dart';
import 'package:squawker/client_android.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:quiver/iterables.dart';
import 'package:synchronized/synchronized.dart';

const Duration _defaultTimeout = Duration(seconds: 30);
const String _accessToken = 'AAAAAAAAAAAAAAAAAAAAAGHtAgAAAAAA%2Bx7ILXNILCqkSGIzy6faIHZ9s3Q%3DQy97w6SIrzE7lQwPJEYQBsArEE2fC25caFwRBvAGi456G09vGR';

class _SquawkerTwitterClient extends TwitterClient {
  static final log = Logger('_SquawkerTwitterClient');

  _SquawkerTwitterClient() : super(consumerKey: '', consumerSecret: '', token: '', secret: '');

  static final Lock _lock = Lock();
  static Completer? _guestTokenCompleter;
  static String? _guestToken;
  static int _expiresAt = -1;
  static int _tokenLimit = -1;
  static int _tokenRemaining = -1;

  @override
  Future<http.Response> get(Uri uri, {Map<String, String>? headers, Duration? timeout}) async {
    return getWithRateFetchCtx(uri, headers: headers, timeout: timeout);
  }

  Future<http.Response> getWithRateFetchCtx(Uri uri, {Map<String, String>? headers, Duration? timeout, RateFetchContext? fetchContext}) async {
    try {
      log.info('Fetching $uri');
      http.Response response = await TwitterAndroid.fetch(uri, headers: headers, fetchContext: fetchContext).timeout(timeout ?? _defaultTimeout);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response;
      } else {
        log.severe('The request ${uri.path} has a response in error: ${response.statusCode} - ${utf8.decode(response.bodyBytes.toList())}');
        return Future.error(response);
      }
    }
    on Exception catch (err) {
      if (err is! GuestAccountException && err is! RateLimitException) {
        log.severe('The request ${uri.path} has an error: ${err.toString()}');
      }
      return Future.error(ExceptionResponse(err));
    }
  }

  static Future<String> getToken() async {
    var guestToken = await _lock.synchronized(() async {
      if (_guestToken != null) {
        _guestTokenCompleter = null;
        // If we don't have an expiry or limit, it's probably because we haven't made a request yet, so assume they're OK
        if (_expiresAt == -1 && _tokenLimit == -1 && _tokenRemaining == -1) {
          return _guestToken!;
        }

        // Check if the token we have hasn't expired yet
        if (DateTime.now().millisecondsSinceEpoch < _expiresAt) {
          // Check if the token we have still has usages remaining
          if (_tokenRemaining < _tokenLimit) {
            return _guestToken!;
          }
        }
      }

      if (_guestTokenCompleter != null) {
        return _guestTokenCompleter!.future;
      }
      _guestTokenCompleter = Completer();

      // Otherwise, fetch a new token
      _guestToken = null;
      _tokenLimit = -1;
      _tokenRemaining = -1;
      _expiresAt = -1;

      return null;
    });
    if (guestToken != null) {
      return guestToken;
    }

    log.info('Refreshing the Twitter token');

    var response = await http.post(Uri.parse('https://api.twitter.com/1.1/guest/activate.json'), headers: {
      'Authorization': 'Bearer $_accessToken',
    });

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      if (result.containsKey('guest_token')) {
        _guestToken = result['guest_token'];

        _guestTokenCompleter!.complete(_guestToken!);
        return _guestToken!;
      }
    }

    var exc = Exception('Unable to refresh the token. The response (${response.statusCode}) from Twitter was: ${response.body}');
    _guestTokenCompleter!.completeError(exc);
    throw exc;
  }

  static Future<http.Response> fetch(Uri uri, {Map<String, String>? headers}) async {
    log.info('Fetching $uri');

    var response = await http.get(uri, headers: {
      ...?headers,
      'authorization': 'Bearer $_accessToken',
      'x-guest-token': await getToken(),
      'x-twitter-active-user': 'yes',
      'user-agent': faker.internet.userAgent()
    });

    var headerRateLimitReset = response.headers['x-rate-limit-reset'];
    var headerRateLimitRemaining = response.headers['x-rate-limit-remaining'];
    var headerRateLimitLimit = response.headers['x-rate-limit-limit'];

    if (headerRateLimitReset == null || headerRateLimitRemaining == null || headerRateLimitLimit == null) {
      // If the rate limit headers are missing, the endpoint probably doesn't send them back
      return response;
    }

    // Update our token's rate limit counters
    _expiresAt = int.parse(headerRateLimitReset) * 1000;
    _tokenRemaining = int.parse(headerRateLimitRemaining);
    _tokenLimit = int.parse(headerRateLimitLimit);

    return response;
  }
}

class UnknownProfileResultType implements Exception {
  final String type;
  final String message;
  final String uri;

  UnknownProfileResultType(this.type, this.message, this.uri);

  @override
  String toString() {
    return 'Unknown profile result type: {type: $type, message: $message, uri: $uri}';
  }
}

class UnknownProfileUnavailableReason implements Exception {
  final String reason;
  final String uri;

  UnknownProfileUnavailableReason(this.reason, this.uri);

  @override
  String toString() {
    return 'Unknown profile unavailable reason: {reason: $reason, uri: $uri}';
  }
}

class Twitter {
  static final TwitterApi _twitterApi = TwitterApi(client: _SquawkerTwitterClient());

  static final FFCache _cache = FFCache();

  static Map<String, String> defaultParams = {
    'include_profile_interstitial_type': '1',
    'include_blocking': '1',
    'include_blocked_by': '1',
    'include_followed_by': '1',
    'include_mute_edge': '1',
    'include_can_dm': '1',
    'include_can_media_tag': '1',
    'include_ext_has_nft_avatar': '1',
    'include_ext_is_blue_verified': '1',
    'skip_status': '1',
    'cards_platform': 'Web-12',
    'include_cards': '1',
    'include_ext_alt_text': '1',
    'include_ext_limited_action_results': '0',
    'include_quote_count': '1',
    'include_reply_count': '1',
    'tweet_mode': 'extended',
    'include_ext_collab_control': '1',
    'include_entities': '1',
    'include_user_entities': '1',
    'include_ext_media_color': '1',
    'include_ext_media_availability': '1',
    'include_ext_sensitive_media_warning': '1',
    'include_ext_trusted_friends_metadata': '1',
    'send_error_codes': '1',
    'simple_quoted_tweet': '1',
    'pc': '1',
    'spelling_corrections': '1',
    'include_ext_edit_control': '1',
    'ext': 'mediaStats,highlightedLabel,hasNftAvatar,voiceInfo,enrichments,superFollowMetadata,unmentionInfo,editControl,collab_control,vibe,'
  };

  static Map<String, String> defaultFeatures = {
    'android_graphql_skip_api_media_color_palette': 'false',
    'blue_business_profile_image_shape_enabled': 'false',
    'creator_subscriptions_subscription_count_enabled': 'false',
    'creator_subscriptions_tweet_preview_api_enabled': 'true',
    'freedom_of_speech_not_reach_fetch_enabled': 'false',
    'graphql_is_translatable_rweb_tweet_is_translatable_enabled': 'false',
    'hidden_profile_likes_enabled': 'false',
    'highlights_tweets_tab_ui_enabled': 'false',
    'interactive_text_enabled': 'false',
    'longform_notetweets_consumption_enabled': 'true',
    'longform_notetweets_inline_media_enabled': 'false',
    'longform_notetweets_richtext_consumption_enabled': 'true',
    'longform_notetweets_rich_text_read_enabled': 'false',
    'responsive_web_edit_tweet_api_enabled': 'false',
    'responsive_web_enhance_cards_enabled': 'false',
    'responsive_web_graphql_exclude_directive_enabled': 'true',
    'responsive_web_graphql_skip_user_profile_image_extensions_enabled': 'false',
    'responsive_web_graphql_timeline_navigation_enabled': 'false',
    'responsive_web_media_download_video_enabled': 'false',
    'responsive_web_text_conversations_enabled': 'false',
    'responsive_web_twitter_article_tweet_consumption_enabled': 'false',
    'responsive_web_twitter_blue_verified_badge_is_enabled': 'true',
    'rweb_lists_timeline_redesign_enabled': 'true',
    'spaces_2022_h2_clipping': 'true',
    'spaces_2022_h2_spaces_communities': 'true',
    'standardized_nudges_misinfo': 'false',
    'subscriptions_verification_info_enabled': 'true',
    'subscriptions_verification_info_reason_enabled': 'true',
    'subscriptions_verification_info_verified_since_enabled': 'true',
    'super_follow_badge_privacy_enabled': 'false',
    'super_follow_exclusive_tweet_notifications_enabled': 'false',
    'super_follow_tweet_api_enabled': 'false',
    'super_follow_user_api_enabled': 'false',
    'tweet_awards_web_tipping_enabled': 'false',
    'tweet_with_visibility_results_prefer_gql_limited_actions_policy_enabled': 'false',
    'tweetypie_unmention_optimization_enabled': 'false',
    'unified_cards_ad_metadata_container_dynamic_card_content_query_enabled': 'false',
    'verified_phone_label_enabled': 'false',
    'vibe_api_enabled': 'false',
    'view_counts_everywhere_api_enabled': 'false'
  };

  static Future<Profile> getProfileById(String id) async {
    var uri = Uri.https('api.twitter.com', '/graphql/Lxg1V9AiIzzXEiP2c8dRnw/UserByRestId', {
      'variables': jsonEncode({
        'userId': id,
        'withHighlightedLabel': true,
        'withSafetyModeUserFields': true,
        'withSuperFollowsUserFields': true
      }),
      'features': jsonEncode(defaultFeatures)
    });

    return _getProfile(uri);
  }

  static Future<Profile> getProfileByScreenName(String screenName) async {
    var uri = Uri.https('api.twitter.com', '/graphql/oUZZZ8Oddwxs8Cd3iW3UEA/UserByScreenName', {
      'variables': jsonEncode({
        'screen_name': screenName,
        'withHighlightedLabel': true,
        'withSafetyModeUserFields': true,
        'withSuperFollowsUserFields': true
      }),
      'features': jsonEncode(defaultFeatures)
    });

    return _getProfile(uri);
  }

  static Future<Profile> _getProfile(Uri uri) async {
    var response = await _twitterApi.client.get(uri);
    if (response.body.isEmpty) {
      throw TwitterError(code: 0, message: 'Response is empty', uri: uri.toString());
    }
    var content = jsonDecode(response.body) as Map<String, dynamic>;

    var hasErrors = content.containsKey('errors');
    if (hasErrors && content['errors'] != null) {
      var errors = List.from(content['errors']);
      if (errors.isEmpty) {
        throw TwitterError(code: 0, message: 'Unknown error', uri: uri.toString());
      } else {
        throw TwitterError(code: errors.first['code'], message: errors.first['message'], uri: uri.toString());
      }
    }

    var result = content['data']?['user']?['result'];
    if (result == null) {
      throw TwitterError(uri: uri.toString(), code: 50, message: L10n.current.user_not_found);
    }

    var resultType = result['__typename'];
    if (resultType != null) {
      switch (resultType) {
        case 'UserUnavailable':
          var code = result['reason'];
          if (code == 'Suspended') {
            throw TwitterError(code: 63, message: result['reason'], uri: uri.toString());
          } else {
            throw TwitterError(code: -1, message: result['reason'], uri: uri.toString());
          }
        case 'User':
          // This means everything's fine
          break;
        default:
          // an error happened
          break;
      }
    }

    var user = UserWithExtra.fromJson(
        {...result['legacy'], 'id_str': result['rest_id'], 'ext_is_blue_verified': result['is_blue_verified']});
    var pins = List<String>.from(result['legacy']['pinned_tweet_ids_str']);

    return Profile(user, pins);
  }

  static Future<Follows> getProfileFollows(String screenName, String type, {int? cursor, int? count = 200}) async {
    var response = type == 'following'
        ? await _twitterApi.userService
            .friendsList(screenName: screenName, cursor: cursor, count: count, skipStatus: true)
        : await _twitterApi.userService
            .followersList(screenName: screenName, cursor: cursor, count: count, skipStatus: true);

    return Follows(
        cursorBottom: int.parse(response.nextCursorStr ?? '-1'),
        cursorTop: int.parse(response.previousCursorStr ?? '-1'),
        users: response.users?.map((e) => UserWithExtra.fromJson(e.toJson())).toList() ?? []);
  }

  static List<TweetChain> createTweetChains(List<dynamic> addEntries) {
    List<TweetChain> replies = [];

    for (var entry in addEntries) {
      var entryId = entry['entryId'] as String;
      if (entryId.startsWith('tweet-')) {
        if (entry['content']['itemContent']['promotedMetadata'] == null) {
          var result = entry['content']['itemContent']['tweet_results']?['result'];

          if (result != null) {
            if (result['rest_id'] != null || result['tweet'] != null) {
              result = result['rest_id'] != null ? result : result['tweet'];
              replies.add(TweetChain(id: result['rest_id'], tweets: [TweetWithCard.fromGraphqlJson(result)], isPinned: false));
            }
            else {
              replies.add(TweetChain(id: entryId.substring(6), tweets: [TweetWithCard.tombstone({})], isPinned: false));
            }
          } else {
            replies.add(TweetChain(id: entryId.substring(6), tweets: [TweetWithCard.tombstone({})], isPinned: false));
          }
        }
      }

      if (entryId.startsWith('cursor-bottom') || entryId.startsWith('cursor-showMore')) {
        // TODO: Use as the "next page" cursor
      }

      if (entryId.startsWith('conversationthread')) {
        List<TweetWithCard> tweets = [];

        // TODO: This is missing tombstone support
        for (var item in entry['content']['items']) {
          var itemType = item['item']?['itemContent']?['itemType'];
          if (itemType == 'TimelineTweet') {
            if (item['item']['itemContent']['promotedMetadata'] == null) {
              var result = item['item']['itemContent']['tweet_results']?['result'];
              if (result != null) {
                if (result['rest_id'] != null || result['tweet'] != null) {
                  tweets.add(TweetWithCard.fromGraphqlJson(result['rest_id'] != null ? result : result['tweet']));
                } else {
                  tweets.add(TweetWithCard.tombstone({}));
                }
              } else {
                tweets.add(TweetWithCard.tombstone({}));
              }
            }
          }
        }

        // TODO: There must be a better way of getting the conversation ID
        replies.add(TweetChain(id: entryId.replaceFirst('conversationthread-', ''), tweets: tweets, isPinned: false));
      }
    }

    return replies;
  }

  static Future<TweetStatus> getTweet(String id, {String? cursor}) async {
    var variables = {
      'focalTweetId': id,
      //'referrer': 'tweet',
      //'with_rux_injections': false,
      'includePromotedContent': false,
      //'withCommunity': true,
      'withQuickPromoteEligibilityTweetFields': false,
      'includeHasBirdwatchNotes': false,
      'withBirdwatchNotes': false,
      'withVoice': false,
      'withV2Timeline': true
    };

    if (cursor != null) {
      variables['cursor'] = cursor;
    }

    var response = await _twitterApi.client.get(Uri.https('api.twitter.com', '/graphql/3XDB26fBve-MmjHaWTUZxA/TweetDetail', {
      'variables': jsonEncode(variables),
      'features': jsonEncode(defaultFeatures),
    }));
    if (response.body.isEmpty) {
      return TweetStatus(chains: [], cursorBottom: null, cursorTop: null);
    }
    var result = json.decode(response.body);

    var instructions = List.from(result?['data']?['threaded_conversation_with_injections_v2']?['instructions'] ?? []);
    if (instructions.isEmpty) {
      return TweetStatus(chains: [], cursorBottom: null, cursorTop: null);
    }

    var addEntriesInstructions = instructions.firstWhereOrNull((e) => e['type'] == 'TimelineAddEntries');
    if (addEntriesInstructions == null) {
      return TweetStatus(chains: [], cursorBottom: null, cursorTop: null);
    }

    var addEntries = List.from(addEntriesInstructions['entries']);
    var repEntries = List.from(instructions.where((e) => e['type'] == 'TimelineReplaceEntry'));

    // TODO: Could this use createUnconversationedChains at some point?
    var chains = createTweetChains(addEntries);

    String? cursorBottom = getCursor(addEntries, repEntries, 'cursor-bottom', 'Bottom');
    String? cursorTop = getCursor(addEntries, repEntries, 'cursor-top', 'Top');

    return TweetStatus(chains: chains, cursorBottom: cursorBottom, cursorTop: cursorTop);
  }

  static Future<TweetStatus> searchTweetsGraphql(String query, bool includeReplies, {int limit = 25, String? cursor, RateFetchContext? fetchContext}) async {
    var variables = {
      "rawQuery": query,
      "count": limit.toString(),
      "product": 'Latest',
      "withDownvotePerspective": false,
      "withReactionsMetadata": false,
      "withReactionsPerspective": false
    };

    if (cursor != null) {
      variables['cursor'] = cursor;
    }

    var uri = Uri.https('api.twitter.com', '/graphql/nK1dw4oV3k4w5TdtcAdSww/SearchTimeline', {
      'variables': jsonEncode(variables),
      'features': jsonEncode(defaultFeatures)
    });

    var response = await (_twitterApi.client as _SquawkerTwitterClient).getWithRateFetchCtx(uri, fetchContext: fetchContext);
    if (response.body.isEmpty) {
      return TweetStatus(chains: [], cursorBottom: null, cursorTop: null);
    }
    var result = json.decode(response.body);

    var timeline = result?['data']?['search_by_raw_query']?['search_timeline'];
    if (timeline == null) {
      return TweetStatus(chains: [], cursorBottom: null, cursorTop: null);
    }

    return createUnconversationedChainsGraphql(timeline, 'tweet', [], includeReplies);
  }

  static Future<TweetStatus> searchTweets(String query, bool includeReplies, {int limit = 25, String? cursor, String? cursorType, bool leanerFeeds = false, RateFetchContext? fetchContext}) async {
    var queryParameters = {
      'q': query,
      'count': limit.toString(),
      'tweet_mode': 'extended',
      'skip_status': '1',
      'include_entities': '1',
      'include_user_entities': '1',
      'include_can_media_tag': '1',
      'include_ext_is_blue_verified': '1',
      'include_ext_media_availability': '1',
      'include_ext_alt_text': '1',
      'include_quote_count': '1',
      'include_reply_count': '1',
      'simple_quoted_tweet': '1',
      'send_error_codes': '1',
      'tweet_search_mode': 'live',
    };
    if (!leanerFeeds) {
      queryParameters['cards_platform'] = 'Web-12';
      queryParameters['include_cards'] = '1';
    }

    if (cursor != null && cursorType != null) {
      if (cursorType == 'cursor_bottom') {
        queryParameters['max_id'] = cursor;
      }
      else { // cursorType == 'top'
        queryParameters['since_id'] = cursor;
      }
    }

    var response = await (_twitterApi.client as _SquawkerTwitterClient).getWithRateFetchCtx(Uri.https('api.twitter.com', '/1.1/search/tweets.json', queryParameters), fetchContext: fetchContext);
    if (response.body.isEmpty) {
      return TweetStatus(chains: [], cursorBottom: null, cursorTop: null);
    }
    var result = json.decode(response.body);

    var tweets = result['statuses'];

    if (tweets == null || tweets.isEmpty) {
      return TweetStatus(chains: [], cursorBottom: null, cursorTop: null);
    }

    var tweetChains = _createTweetsChains(tweets, includeReplies);

    var cursorBottom = result['search_metadata']['since_id_str'] as String?;
    var cursorTop = result['search_metadata']['max_id_str'] as String?;

    return TweetStatus(chains: tweetChains, cursorBottom: cursorBottom, cursorTop: cursorTop);
  }

  static List<TweetChain> _createTweetsChains(List<dynamic> tweets, bool includeReplies) {
    var tweetMap = <String, TweetWithCard>{};

    for (var tweetData in tweets) {
      var tweet = _fromCardJsonLegacy(tweetData);

      if (!includeReplies && tweet.inReplyToStatusIdStr != null) {
        // Exclude replies
        continue;
      }

      tweetMap[tweet.idStr!] = tweet;
    }

    var chains = <TweetChain>[];

    for (var tweet in tweetMap.values) {
      var chainId = tweet.conversationIdStr ?? tweet.idStr!;
      var chainExists = chains.any((chain) => chain.id == chainId);

      if (chainExists) {
        // Add tweet to existing chain
        var existingChain = chains.firstWhere((chain) => chain.id == chainId);
        existingChain.tweets.add(tweet);
      } else {
        // Create new chain
        chains.add(TweetChain(id: chainId, tweets: [tweet], isPinned: false));
      }
    }

    return chains;
  }

  static TweetWithCard _fromCardJsonLegacy(Map<String,dynamic> tweetData) {
    var tweet = TweetWithCard.fromJson(tweetData);

    var quotedStatusMap = tweetData['quoted_status'];
    if (quotedStatusMap != null) {
      TweetWithCard quotedStatus = _fromCardJsonLegacy(quotedStatusMap);
      tweet.quotedStatus = quotedStatus;
      tweet.quotedStatusWithCard = quotedStatus;
    }
    var retweetedStatusMap = tweetData['retweeted_status'];
    if (retweetedStatusMap != null) {
      TweetWithCard retweetedStatus = _fromCardJsonLegacy(retweetedStatusMap);
      tweet.retweetedStatus = retweetedStatus;
      tweet.retweetedStatusWithCard = retweetedStatus;
    }

    return tweet;
  }

  static Future<List<UserWithExtra>> searchUsers(String query, {int limit = 25, String? maxId, String? cursor}) async {
    var queryParameters = {
      ...defaultParams,
      'count': limit.toString(),
      'max_id': maxId,
      'q': query,
      'pc': '1',
      'spelling_corrections': '1',
      'result_filter': 'user'
    };

    if (cursor != null) {
      queryParameters['cursor'] = cursor;
    }

    var response = await _twitterApi.client.get(Uri.https('api.twitter.com', '/1.1/users/search.json', queryParameters));
    if (response.body.isEmpty) {
      return [];
    }

    List result = json.decode(response.body);

    if (result.isEmpty) {
      return [];
    }

    return result.map((e) => UserWithExtra.fromJson(e)).toList();
  }

  static Future<List<TrendLocation>> getTrendLocations() async {
    var result = await _cache.getOrCreateAsJSON('trends.locations', const Duration(days: 2), () async {
      var locations = await _twitterApi.trendsService.available();

      return jsonEncode(locations.map((e) => e.toJson()).toList());
    });

    return List.from(jsonDecode(result)).map((e) => TrendLocation.fromJson(e)).toList(growable: false);
  }

  static Future<List<Trends>> getTrends(int location) async {
    var result = await _cache.getOrCreateAsJSON('trends.$location', const Duration(minutes: 2), () async {
      var trends = await _twitterApi.trendsService.place(id: location);

      return jsonEncode(trends.map((e) => e.toJson()).toList());
    });

    return List.from(jsonDecode(result)).map((e) => Trends.fromJson(e)).toList(growable: false);
  }

  static Future<TweetStatus> getTweets(String id, String type, List<String> pinnedTweets,
      {int count = 10, String? cursor, bool includeReplies = true, bool includeRetweets = true}) async {
    var query = {
      ...defaultParams,
      'include_tweet_replies': includeReplies ? '1' : '0',
      'include_want_retweets': includeRetweets ? '1' : '0', // This may not actually do anything
      'count': count.toString(),
    };

    if (cursor != null) {
      query['cursor'] = cursor;
    }

    var response = await _twitterApi.client.get(Uri.https('api.twitter.com', '/2/timeline/$type/$id.json', query));

    var result = json.decode(response.body);
    if (response.body.isEmpty) {
      return TweetStatus(chains: [], cursorBottom: null, cursorTop: null);
    }
    return createUnconversationedChains(result, 'tweet', 'homeConversation', pinnedTweets, includeReplies);
  }

  static String? getCursor(List<dynamic> addEntries, List<dynamic> repEntries, String legacyType, String type) {
    String? cursor;

    Map<String, dynamic>? cursorEntry;

    var isLegacyCursor = addEntries.any((element) => element['entryId'].startsWith('cursor'));
    if (isLegacyCursor) {
      cursorEntry = addEntries.firstWhere((e) => e['entryId'].contains(legacyType), orElse: () => null);
    } else {
      cursorEntry = addEntries
          .where((e) => e['entryId'].startsWith('sq-C'))
          .firstWhere((e) => e['content']['operation']['cursor']['cursorType'] == type, orElse: () => null);
    }

    if (cursorEntry != null) {
      var content = cursorEntry['content'];
      if (content.containsKey('value')) {
        cursor = content['value'];
      } else if (content.containsKey('operation')) {
        cursor = content['operation']['cursor']['value'];
      } else {
        cursor = content['itemContent']['value'];
      }
    } else {
      // Look for a "replaceEntry" with the cursor
      var cursorReplaceEntry = repEntries.firstWhere(
          (e) => e.containsKey('replaceEntry')
              ? e['replaceEntry']['entryIdToReplace'].contains(type)
              : e['entry']['content']['cursorType'].contains(type),
          orElse: () => null);

      if (cursorReplaceEntry != null) {
        cursor = cursorReplaceEntry.containsKey('replaceEntry')
            ? cursorReplaceEntry['replaceEntry']['entry']['content']['operation']['cursor']['value']
            : cursorReplaceEntry['entry']['content']['value'];
      }
    }

    return cursor;
  }

  static TweetStatus createUnconversationedChainsGraphql(Map<String, dynamic> result, String tweetIndicator,
      List<String> pinnedTweets, bool includeReplies) {
    var instructions = List.from(result['timeline']['instructions']);
    if (instructions.isEmpty || !instructions.any((e) => e['type'] == 'TimelineAddEntries')) {
      return TweetStatus(chains: [], cursorBottom: null, cursorTop: null);
    }

    var addEntries = List.from(instructions.firstWhere((e) => e['type'] == 'TimelineAddEntries')['entries']);
    var repEntries = List.from(instructions.where((e) => e['type'] == 'TimelineReplaceEntry'));

    String? cursorBottom = getCursor(addEntries, repEntries, 'cursor-bottom', 'Bottom');
    String? cursorTop = getCursor(addEntries, repEntries, 'cursor-top', 'Top');

    var tweets = _createTweetsGraphql(tweetIndicator, addEntries, includeReplies);

    // First, get all the IDs of the tweets we need to display
    var tweetEntries = addEntries
        .where((e) => e['entryId'].contains(tweetIndicator))
        .sorted((a, b) => b['sortIndex'].compareTo(a['sortIndex']))
        .map((e) => e['content']['itemContent']['tweet_results']['result']['rest_id'])
        .cast<String>()
        .toList();

    Map<String, List<TweetWithCard>> conversations =
        tweets.values.where((e) => tweetEntries.contains(e.idStr)).groupBy((e) {
      if (e.conversationIdStr != null) {
        // Then group the tweets-to-display by their conversation ID
        return e.conversationIdStr;
      }

      return e.idStr;
    }).cast<String, List<TweetWithCard>>();

    List<TweetChain> chains = [];

    // Order all the conversations by newest first (assuming the ID is an incrementing key), and create a chain from them
    for (var conversation in conversations.entries.sorted((a, b) => b.key.compareTo(a.key))) {
      var chainTweets = conversation.value.sorted((a, b) => a.idStr!.compareTo(b.idStr!)).toList();

      chains.add(TweetChain(id: conversation.key, tweets: chainTweets, isPinned: false));
    }

    // If we want to show pinned tweets, add them before the chains that we already have
    if (pinnedTweets.isNotEmpty) {
      for (var id in pinnedTweets) {
        // It's possible for the pinned tweet to either not exist, or not be returned, so handle that
        if (tweets.containsKey(id)) {
          chains.insert(0, TweetChain(id: id, tweets: [tweets[id]!], isPinned: true));
        }
      }
    }

    return TweetStatus(chains: chains, cursorBottom: cursorBottom, cursorTop: cursorTop);
  }

  static TweetStatus createUnconversationedChains(Map<String, dynamic> result, String tweetIndicator, String conversationIndicator,
      List<String> pinnedTweets, bool includeReplies) {
    var instructions = List.from(result['timeline']['instructions']);
    if (instructions.isEmpty || !instructions.any((e) => e.containsKey('addEntries'))) {
      return TweetStatus(chains: [], cursorBottom: null, cursorTop: null);
    }

    var addEntries = List.from(instructions.firstWhere((e) => e.containsKey('addEntries'))['addEntries']['entries']);
    var repEntries = List.from(instructions.where((e) => e.containsKey('replaceEntry')));

    String? cursorBottom = getCursor(addEntries, repEntries, 'cursor-bottom', 'Bottom');
    String? cursorTop = getCursor(addEntries, repEntries, 'cursor-top', 'Top');

    var tweets = _createTweets(tweetIndicator, result, includeReplies);

    // First, get all the IDs of the tweets we need to display
    var tweetEntries = addEntries
        .where((e) => e['entryId'].contains(tweetIndicator) || e['entryId'].contains(conversationIndicator))
        .sorted((a, b) => b['sortIndex'].compareTo(a['sortIndex']))
        .map((e) {
          if (e['entryId'].contains(tweetIndicator)) {
            return [e];
          }
          else {
            return e['content']['timelineModule']['items'];
          }
        })
        .expand((e) => e)
        .map((e) {
          if (e['content'] != null) {
            return e['content']['item']['content']['tweet']['id'];
          }
          else {
            return e['item']['content']['tweet']['id'];
          }
        })
        .cast<String>()
        .toList();

    Map<String, List<TweetWithCard>> conversations =
        tweets.values.where((e) => tweetEntries.contains(e.idStr)).groupBy((e) {
      // TODO: I don't think a flag is the right way to handle this
      if (e.conversationIdStr != null) {
        // Then group the tweets-to-display by their conversation ID
        return e.conversationIdStr;
      }

      return e.idStr;
    }).cast<String, List<TweetWithCard>>();

    List<TweetChain> chains = [];

    // Order all the conversations by newest first (assuming the ID is an incrementing key), and create a chain from them
    for (var conversation in conversations.entries.sorted((a, b) => b.key.compareTo(a.key))) {
      var chainTweets = conversation.value.sorted((a, b) => b.idStr!.compareTo(a.idStr!)).toList();

      chains.add(TweetChain(id: conversation.key, tweets: chainTweets, isPinned: false));
    }

    // If we want to show pinned tweets, add them before the chains that we already have
    if (pinnedTweets.isNotEmpty) {
      for (var id in pinnedTweets) {
        // It's possible for the pinned tweet to either not exist, or not be returned, so handle that
        if (tweets.containsKey(id)) {
          chains.insert(0, TweetChain(id: id, tweets: [tweets[id]!], isPinned: true));
        }
      }
    }

    return TweetStatus(chains: chains, cursorBottom: cursorBottom, cursorTop: cursorTop);
  }

  static Future<List<UserWithExtra>> getUsers(Iterable<String> ids) async {
    // Split into groups of 100, as the API only supports that many at a time
    List<Future<List<UserWithExtra>>> futures = [];

    var groups = partition(ids, 100);
    for (var group in groups) {
      futures.add(_getUsersPage(group));
    }

    return (await Future.wait(futures)).expand((element) => element).toList();
  }

  static Future<List<UserWithExtra>> _getUsersPage(Iterable<String> ids) async {
    var response = await _twitterApi.client.get(Uri.https('api.twitter.com', '/1.1/users/lookup.json', {
      ...defaultParams,
      'user_id': ids.join(','),
    }));

    var result = json.decode(response.body);

    return List.from(result).map((e) => UserWithExtra.fromJson(e)).toList(growable: false);
  }

  static Map<String, TweetWithCard> _createTweetsGraphql(
      String entryPrefix, List<dynamic> allTweets, bool includeReplies) {
    bool includeTweet(dynamic t) {
      // Exclude any items that aren't tweets
      if (!t['entryId'].startsWith(entryPrefix)) {
        return false;
      }

      if (t['content']['itemContent']['promotedMetadata'] != null) {
        return false;
      }

      if (includeReplies) {
        return true;
      }

      // TODO
      return t['in_reply_to_status_id'] == null || t['in_reply_to_user_id'] == null;
    }

    var filteredTweets = allTweets.where(includeTweet);

    Map<String, Map<String, dynamic>> cards = {};

    var globalTweets = Map.fromEntries(filteredTweets.map((e) {
      var elm = e['content']['itemContent']['tweet_results']['result'];
      if (elm['card']?['legacy'] != null) {
        Map<String, dynamic> card = elm['card']['legacy'];
        List bindingValuesList = card['binding_values'] as List;
        Map bindingValues = bindingValuesList.fold({}, (prev, elm) { prev[elm['key']] = elm['value']; return prev; });
        card['binding_values'] = bindingValues;
        cards[elm['rest_id'] as String] = card;
      }
      return MapEntry(elm['rest_id'] as String, elm['legacy']);
    }));

    Map<String, bool> blueCheckUsers = {};

    var globalUsers = Map.fromEntries(filteredTweets.map((e) {
      var elm = e['content']['itemContent']['tweet_results']['result']['core']['user_results']['result'];
      blueCheckUsers[elm['rest_id'] as String] = elm['is_blue_verified'];
      return MapEntry(elm['rest_id'] as String, elm['legacy']);
    }));

    Map<String, Map> quotedStatusNotesTweets = {};

    quotedStatusNotesTweets = filteredTweets.fold({}, (prev, e) {
      var result = e['content']['itemContent']['tweet_results']['result'];
      result = result['rest_id'] == null ? result['tweet'] : result;
      var restId = result['rest_id'];
      var quotedResult = result['quoted_status_result']?['result'];
      if (quotedResult != null) {
        prev[restId] = {};
        prev[restId]!['quotedResult'] = quotedResult;
      }
      var noteResult = result['note_tweet']?['note_tweet_results']?['result'];
      if (noteResult != null) {
        if (prev[restId] == null) {
          prev[restId] = {};
        }
        prev[restId]!['noteText'] = noteResult['text'];
        prev[restId]!['noteEntities'] = Entities.fromJson(noteResult['entity_set']);
      }
      return prev;
    });

    var tweets = globalTweets.values.map((e) => TweetWithCard.fromCardJson(globalTweets, globalUsers, e)).toList();

    for (var twt in tweets) {
      if (twt.user?.idStr != null) {
        twt.user!.verified = blueCheckUsers[twt.user!.idStr];
      }
      twt.card ??= cards[twt.idStr];
      if (twt.quotedStatus == null && quotedStatusNotesTweets[twt.idStr]?['quotedResult'] != null) {
        TweetWithCard twtCard = TweetWithCard.fromGraphqlJson(quotedStatusNotesTweets[twt.idStr]!['quotedResult'] as Map<String, dynamic>);
        twt.quotedStatus = twtCard;
        twt.quotedStatusWithCard = twtCard;
      }
      twt.noteText ??= quotedStatusNotesTweets[twt.idStr]?['noteText'];
      if (quotedStatusNotesTweets[twt.idStr]?['noteEntities'] != null) {
        Entities noteEntities = quotedStatusNotesTweets[twt.idStr]!['noteEntities'];
        twt.entities = twt.entities == null ? noteEntities : TweetWithCard.copyEntities(noteEntities, twt.entities!);
        twt.extendedEntities = twt.extendedEntities == null ? noteEntities : TweetWithCard.copyEntities(noteEntities, twt.extendedEntities!);
      }
    }

    return {for (var e in tweets) e.idStr!: e};  }

  static Map<String, TweetWithCard> _createTweets(
      String entryPrefix, Map<String, dynamic> result, bool includeReplies) {
    var globalTweets = result['globalObjects']['tweets'] as Map<String, dynamic>;
    var globalUsers = result['globalObjects']['users'];

    bool includeTweet(dynamic t) {
      if (includeReplies) {
        return true;
      }

      return t['in_reply_to_status_id'] == null || t['in_reply_to_user_id'] == null;
    }

    var tweets = globalTweets.values
        .where(includeTweet)
        .map((e) => TweetWithCard.fromCardJson(globalTweets, globalUsers, e))
        .toList();

    return {for (var e in tweets) e.idStr!: e};
  }

  static Future<Map<String, dynamic>> getBroadcastDetails(String key) async {
    var response = await _twitterApi.client.get(Uri.https('api.twitter.com', '/1.1/live_video_stream/status/$key'));

    return json.decode(response.body);
  }
}

class TweetWithCard extends Tweet {
  String? noteText;
  Map<String, dynamic>? card;
  String? conversationIdStr;
  TweetWithCard? quotedStatusWithCard;
  TweetWithCard? retweetedStatusWithCard;
  bool? isTombstone;

  TweetWithCard();

  @override
  Map<String, dynamic> toJson() {
    var json = super.toJson();
    json['card'] = card;
    json['conversationIdStr'] = conversationIdStr;
    json['quotedStatusWithCard'] = quotedStatusWithCard?.toJson();
    json['retweetedStatusWithCard'] = retweetedStatusWithCard?.toJson();
    json['isTombstone'] = isTombstone;

    return json;
  }

  factory TweetWithCard.tombstone(dynamic e) {
    var tweetWithCard = TweetWithCard();
    tweetWithCard.idStr = '';
    tweetWithCard.isTombstone = true;
    tweetWithCard.text = ((e['richText']?['text'] ?? e['text']?['text'] ?? L10n.current.this_tweet_is_unavailable) as String)
        .replaceFirst(' Learn more', '');

    return tweetWithCard;
  }

  factory TweetWithCard.fromJson(Map<String, dynamic> e) {
    var tweet = Tweet.fromJson(e);

    var tweetWithCard = TweetWithCard();
    tweetWithCard.card = e['card'];
    tweetWithCard.conversationIdStr = e['conversationIdStr'];
    tweetWithCard.createdAt = tweet.createdAt;
    tweetWithCard.entities = tweet.entities;
    tweetWithCard.displayTextRange = tweet.displayTextRange;
    tweetWithCard.extendedEntities = tweet.extendedEntities;
    tweetWithCard.favorited = tweet.favorited;
    tweetWithCard.favoriteCount = tweet.favoriteCount;
    tweetWithCard.fullText = tweet.fullText;
    tweetWithCard.idStr = tweet.idStr;
    tweetWithCard.inReplyToScreenName = tweet.inReplyToScreenName;
    tweetWithCard.inReplyToStatusIdStr = tweet.inReplyToStatusIdStr;
    tweetWithCard.inReplyToUserIdStr = tweet.inReplyToUserIdStr;
    tweetWithCard.isQuoteStatus = tweet.isQuoteStatus;
    tweetWithCard.isTombstone = e['is_tombstone'];
    tweetWithCard.lang = tweet.lang;
    tweetWithCard.quoteCount = tweet.quoteCount;
    tweetWithCard.quotedStatusIdStr = tweet.quotedStatusIdStr;
    tweetWithCard.quotedStatusPermalink = tweet.quotedStatusPermalink;
    tweetWithCard.quotedStatusWithCard =
        e['quotedStatusWithCard'] == null ? null : TweetWithCard.fromJson(e['quotedStatusWithCard']);
    tweetWithCard.replyCount = tweet.replyCount;
    tweetWithCard.retweetCount = tweet.retweetCount;
    tweetWithCard.retweeted = tweet.retweeted;
    tweetWithCard.retweetedStatus = tweet.retweetedStatus;
    tweetWithCard.retweetedStatusWithCard =
        e['retweetedStatusWithCard'] == null ? null : TweetWithCard.fromJson(e['retweetedStatusWithCard']);
    tweetWithCard.source = tweet.source;
    tweetWithCard.text = tweet.text;
    tweetWithCard.user = tweet.user;
    tweetWithCard.coordinates = tweet.coordinates;
    tweetWithCard.truncated = tweet.truncated;
    tweetWithCard.place = tweet.place;
    tweetWithCard.possiblySensitive = tweet.possiblySensitive;
    tweetWithCard.possiblySensitiveAppealable = tweet.possiblySensitiveAppealable;

    return tweetWithCard;
  }

  factory TweetWithCard.fromGraphqlJson(Map<String, dynamic> result) {
    var retweetedStatus = result['retweeted_status_result']?.isEmpty ?? true
        ? null
        : TweetWithCard.fromGraphqlJson(result['retweeted_status_result']['result']['rest_id'] == null ? result['retweeted_status_result']['result']['tweet'] : result['retweeted_status_result']['result']);
    var quotedStatus = (result['quoted_status_result']?.isEmpty ?? true) || result['quoted_status_result']['result']['tombstone'] != null
        ? null
        : TweetWithCard.fromGraphqlJson(result['quoted_status_result']['result']['rest_id'] == null ? result['quoted_status_result']['result']['tweet'] : result['quoted_status_result']['result']);
    var resCore = result['core']?['user_results']?['result'];
    var user = resCore?['legacy'] == null
        ? null
        : UserWithExtra.fromJson(
            {...resCore['legacy'], 'id_str': resCore['rest_id'], 'ext_is_blue_verified': resCore['is_blue_verified']});

    String? noteText;
    Entities? noteEntities;

    var noteResult = result['note_tweet']?['note_tweet_results']?['result'];
    if (noteResult?.isNotEmpty ?? false) {
      noteText = noteResult['text'];
      noteEntities = Entities.fromJson(noteResult['entity_set']);
    }

    TweetWithCard tweet = TweetWithCard.fromData(result['legacy'], noteText, noteEntities, user, retweetedStatus, quotedStatus);
    if (tweet.card == null && result['card']?['legacy'] != null) {
      tweet.card = result['card']['legacy'];
      List bindingValuesList = tweet.card!['binding_values'] as List;
      Map<String, dynamic> bindingValues = bindingValuesList.fold({}, (prev, elm) { prev[elm['key']] = elm['value']; return prev; });
      tweet.card!['binding_values'] = bindingValues;
    }
    return tweet;
  }

  factory TweetWithCard.fromCardJson(Map<String, dynamic> tweets, Map<String, dynamic> users, Map<String, dynamic> e) {
    var user = e['user_id_str'] == null ? null : UserWithExtra.fromJson(users[e['user_id_str']]);

    var retweetedStatus = e['retweeted_status_id_str'] == null
        ? null
        : TweetWithCard.fromCardJson(tweets, users, tweets[e['retweeted_status_id_str']]);

    // Some quotes aren't returned, even though we're given their ID, so double check and don't fail with a null value
    TweetWithCard? quotedStatus;
    var quoteId = e['quoted_status_id_str'];
    if (quoteId != null && tweets[quoteId] != null) {
      quotedStatus = TweetWithCard.fromCardJson(tweets, users, tweets[quoteId]);
    }

    return TweetWithCard.fromData(e, null, null, user, retweetedStatus, quotedStatus);
  }

  factory TweetWithCard.fromData(Map<String, dynamic> e, String? noteText, Entities? noteEntities, UserWithExtra? user,
      TweetWithCard? retweetedStatus, TweetWithCard? quotedStatus) {
    TweetWithCard tweet = TweetWithCard();
    tweet.card = e['card'];
    tweet.conversationIdStr = e['conversation_id_str'];
    tweet.createdAt = convertTwitterDateTime(e['created_at']);
    tweet.entities = e['entities'] == null ? null : Entities.fromJson(e['entities']);
    tweet.extendedEntities = e['extended_entities'] == null ? null : Entities.fromJson(e['extended_entities']);
    tweet.favorited = e['favorited'] as bool?;
    tweet.favoriteCount = e['favorite_count'] as int?;
    tweet.fullText = e['full_text'] as String?;
    tweet.idStr = e['id_str'] as String?;
    tweet.inReplyToScreenName = e['in_reply_to_screen_name'] as String?;
    tweet.inReplyToStatusIdStr = e['in_reply_to_status_id_str'] as String?;
    tweet.inReplyToUserIdStr = e['in_reply_to_user_id_str'] as String?;
    tweet.isQuoteStatus = e['is_quote_status'] as bool?;
    tweet.isTombstone = e['is_tombstone'] as bool?;
    tweet.lang = e['lang'] as String?;
    tweet.possiblySensitive = e['possibly_sensitive'] as bool?;
    tweet.quoteCount = e['quote_count'] as int?;
    tweet.quotedStatusIdStr = e['quoted_status_id_str'] as String?;
    tweet.quotedStatusPermalink =
        e['quoted_status_permalink'] == null ? null : QuotedStatusPermalink.fromJson(e['quoted_status_permalink']);
    tweet.replyCount = e['reply_count'] as int?;
    tweet.retweetCount = e['retweet_count'] as int?;
    tweet.retweeted = e['retweeted'] as bool?;
    tweet.source = e['source'] as String?;
    tweet.text = e['text'] ?? e['full_text'] as String?;
    tweet.user = user;

    if (tweet.user != null) {
      tweet.user!.idStr = e['user_id_str'];
    }

    tweet.retweetedStatus = retweetedStatus;
    tweet.retweetedStatusWithCard = retweetedStatus;
    tweet.quotedStatus = quotedStatus;
    tweet.quotedStatusWithCard = quotedStatus;

    tweet.displayTextRange = (e['display_text_range'] as List<dynamic>?)?.map((e) => e as int).toList();

    // TODO
    tweet.coordinates = null;
    tweet.truncated = null;
    tweet.place = null;
    tweet.possiblySensitiveAppealable = null;
    
    tweet.noteText = noteText;
    if (noteEntities != null) {
      tweet.entities = tweet.entities == null ? noteEntities : copyEntities(noteEntities, tweet.entities!);
      tweet.extendedEntities =
          tweet.extendedEntities == null ? noteEntities : copyEntities(noteEntities, tweet.extendedEntities!);
    }

    return tweet;
  }

  static Entities copyEntities(Entities src, Entities trg) {
    if (src.media != null) {
      trg.media = src.media;
    }
    if (src.urls != null) {
      trg.urls = src.urls;
    }
    if (src.userMentions != null) {
      trg.userMentions = src.userMentions;
    }
    if (src.hashtags != null) {
      trg.hashtags = src.hashtags;
    }
    if (src.symbols != null) {
      trg.symbols = src.symbols;
    }
    if (src.polls != null) {
      trg.polls = src.polls;
    }
    return trg;
  }
}

class TweetChain {
  final String id;
  final List<TweetWithCard> tweets;
  final bool isPinned;

  TweetChain({required this.id, required this.tweets, required this.isPinned});

  factory TweetChain.fromJson(Map<String, dynamic> e) {
    var tweets = List.from(e['tweets']).map((e) => TweetWithCard.fromJson(e)).toList();

    return TweetChain(id: e['id'], tweets: tweets, isPinned: e['isPinned']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'tweets': tweets.map((e) => e.toJson()).toList(), 'isPinned': isPinned};
  }
}

class Follows {
  final int? cursorBottom;
  final int? cursorTop;
  final List<UserWithExtra> users;

  Follows({required this.cursorBottom, required this.cursorTop, required this.users});
}

class TweetStatus {
  // final TweetChain after;
  // final TweetChain before;
  final String? cursorBottom;
  final String? cursorTop;
  final List<TweetChain> chains;

  TweetStatus({required this.chains, required this.cursorBottom, required this.cursorTop});
}

class TwitterError {
  final String uri;
  final int code;
  final String message;

  TwitterError({required this.uri, required this.code, required this.message});

  @override
  String toString() {
    return 'TwitterError{code: $code, message: $message, url: $uri}';
  }
}

class SearchHasNoTimelineException {
  final String? query;

  SearchHasNoTimelineException(this.query);

  @override
  String toString() {
    return 'The search has no timeline {query: $query}';
  }
}

class UnknownTimelineItemType implements Exception {
  final String type;
  final String entryId;

  UnknownTimelineItemType(this.type, this.entryId);

  @override
  String toString() {
    return 'Unknown timeline item type: {type: $type, entryId: $entryId}';
  }
}
