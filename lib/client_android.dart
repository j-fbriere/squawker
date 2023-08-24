import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:squawker/utils/iterables.dart';
import 'package:squawker/database/repository.dart';
import 'package:synchronized/synchronized.dart';

class TwitterAndroid {

  static const String _oauthConsumerKey = '3nVuSoBZnx6U4vzUxf5w';
  static const String _oauthConsumerSecret = 'Bcs59EFbbsdF6Sl9Ng71smgStWEGwXXKSjYvPVt7qys';

  static final Lock _lock = Lock();
  static Map? _guestAccountTokens;
  static int _guestAccountIndex = 0;
  static final Map<String,int> _rateLimitRemaining = {};
  static final Map<String,int> _rateLimitReset = {};

  static Future<String> _getAccessToken() async {
    String oauthConsumerKeySecret = base64.encode(utf8.encode('$_oauthConsumerKey:$_oauthConsumerSecret'));

    var response = await http.post(Uri.parse('https://api.twitter.com/oauth2/token'),
        headers: {
          'Authorization': 'Basic $oauthConsumerKeySecret',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: {
          'grant_type': 'client_credentials'
        }
    );

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      if (result.containsKey('access_token')) {
        return result['access_token'];
      }
    }

    throw GuestAccountException('Unable to get the access token. The response (${response.statusCode}) from Twitter was: ${response.body}');
  }

  static Future<String> _getGuestToken(String accessToken) async {
    var response = await http.post(Uri.parse('https://api.twitter.com/1.1/guest/activate.json'),
        headers: {
          'Authorization': 'Bearer $accessToken'
        }
    );

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      if (result.containsKey('guest_token')) {
        return result['guest_token'];
      }
    }

    throw GuestAccountException('Unable to get the guest token. The response (${response.statusCode}) from Twitter was: ${response.body}');
  }

  static Future<String> _getFlowToken(String accessToken, String guestToken) async {
    var response = await http.post(Uri.parse('https://api.twitter.com/1.1/onboarding/task.json?flow_name=welcome&api_version=1&known_device_token=&sim_country_code=us'),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
          'User-Agent': 'TwitterAndroid/9.95.0-release.0 (29950000-r-0) ONEPLUS+A3010/9 (OnePlus;ONEPLUS+A3010;OnePlus;OnePlus3;0;;1;2016)',
          'X-Twitter-API-Version': '5',
          'X-Twitter-Client': 'TwitterAndroid',
          'X-Twitter-Client-Version': '9.95.0-release.0',
          'OS-Version': '28',
          'System-User-Agent': 'Dalvik/2.1.0 (Linux; U; Android 9; ONEPLUS A3010 Build/PKQ1.181203.001)',
          'X-Twitter-Active-User': 'yes',
          'X-Guest-Token': guestToken
        },
      body: json.encode({
        'flow_token': null,
        'input_flow_data': {
          'country_code': null,
          'flow_context': {
            'start_location': {
              'location': 'splash_screen'
            }
          },
          'requested_variant': null,
          'target_user_id': 0
        },
        'subtask_versions': {
          'generic_urt': 3,
          'standard': 1,
          'open_home_timeline': 1,
          'app_locale_update': 1,
          'enter_date': 1,
          'email_verification': 3,
          'enter_password': 5,
          'enter_text': 5,
          'one_tap': 2,
          'cta': 7,
          'single_sign_on': 1,
          'fetch_persisted_data': 1,
          'enter_username': 3,
          'web_modal': 2,
          'fetch_temporary_password': 1,
          'menu_dialog': 1,
          'sign_up_review': 5,
          'interest_picker': 4,
          'user_recommendations_urt': 3,
          'in_app_notification': 1,
          'sign_up': 2,
          'typeahead_search': 1,
          'user_recommendations_list': 4,
          'cta_inline': 1,
          'contacts_live_sync_permission_prompt': 3,
          'choice_selection': 5,
          'js_instrumentation': 1,
          'alert_dialog_suppress_client_events': 1,
          'privacy_options': 1,
          'topics_selector': 1,
          'wait_spinner': 3,
          'tweet_selection_urt': 1,
          'end_flow': 1,
          'settings_list': 7,
          'open_external_link': 1,
          'phone_verification': 5,
          'security_key': 3,
          'select_banner': 2,
          'upload_media': 1,
          'web': 2,
          'alert_dialog': 1,
          'open_account': 2,
          'action_list': 2,
          'enter_phone': 2,
          'open_link': 1,
          'show_code': 1,
          'update_users': 1,
          'check_logged_in_account': 1,
          'enter_email': 2,
          'select_avatar': 4,
          'location_permission_prompt': 2,
          'notifications_permission_prompt': 4
        }
      })
    );

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      if (result.containsKey('flow_token')) {
        return result['flow_token'];
      }
    }

    throw GuestAccountException('Unable to get the flow token. The response (${response.statusCode}) from Twitter was: ${response.body}');
  }

  static Future<dynamic> _getGuestAccountFromTwitter(String accessToken, String guestToken, String flowToken) async {
    var response = await http.post(Uri.parse('https://api.twitter.com/1.1/onboarding/task.json'),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
          'User-Agent': 'TwitterAndroid/9.95.0-release.0 (29950000-r-0) ONEPLUS+A3010/9 (OnePlus;ONEPLUS+A3010;OnePlus;OnePlus3;0;;1;2016)',
          'X-Twitter-API-Version': '5',
          'X-Twitter-Client': 'TwitterAndroid',
          'X-Twitter-Client-Version': '9.95.0-release.0',
          'OS-Version': '28',
          'System-User-Agent': 'Dalvik/2.1.0 (Linux; U; Android 9; ONEPLUS A3010 Build/PKQ1.181203.001)',
          'X-Twitter-Active-User': 'yes',
          'X-Guest-Token': guestToken
        },
        body: json.encode({
          'flow_token': flowToken,
          'subtask_inputs': [{
            'open_link': {
              'link': 'next_link'
            },
            'subtask_id': 'NextTaskOpenLink'
          }
          ],
          'subtask_versions': {
            'generic_urt': 3,
            'standard': 1,
            'open_home_timeline': 1,
            'app_locale_update': 1,
            'enter_date': 1,
            'email_verification': 3,
            'enter_password': 5,
            'enter_text': 5,
            'one_tap': 2,
            'cta': 7,
            'single_sign_on': 1,
            'fetch_persisted_data': 1,
            'enter_username': 3,
            'web_modal': 2,
            'fetch_temporary_password': 1,
            'menu_dialog': 1,
            'sign_up_review': 5,
            'interest_picker': 4,
            'user_recommendations_urt': 3,
            'in_app_notification': 1,
            'sign_up': 2,
            'typeahead_search': 1,
            'user_recommendations_list': 4,
            'cta_inline': 1,
            'contacts_live_sync_permission_prompt': 3,
            'choice_selection': 5,
            'js_instrumentation': 1,
            'alert_dialog_suppress_client_events': 1,
            'privacy_options': 1,
            'topics_selector': 1,
            'wait_spinner': 3,
            'tweet_selection_urt': 1,
            'end_flow': 1,
            'settings_list': 7,
            'open_external_link': 1,
            'phone_verification': 5,
            'security_key': 3,
            'select_banner': 2,
            'upload_media': 1,
            'web': 2,
            'alert_dialog': 1,
            'open_account': 2,
            'action_list': 2,
            'enter_phone': 2,
            'open_link': 1,
            'show_code': 1,
            'update_users': 1,
            'check_logged_in_account': 1,
            'enter_email': 2,
            'select_avatar': 4,
            'location_permission_prompt': 2,
            'notifications_permission_prompt': 4
          }
        })
    );

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      List? subtasks = result['subtasks'];
      if (subtasks != null) {
        var accountElm = subtasks.firstWhereOrNull((task) => task['subtask_id'] == 'OpenAccount');
        if (accountElm != null) {
          var account = accountElm['open_account'];
          return {
            'id_str': account['user']?['id_str'],
            'screen_name': account['user']?['screen_name'],
            'oauth_token': account['oauth_token'],
            'oauth_token_secret': account['oauth_token_secret']
          };
        }
      }
    }

    throw GuestAccountException('Unable to create the guest account. The response (${response.statusCode}) from Twitter was: ${response.body}');
  }

  static Future<Map> _getGuestAccountTokens() async {

    if (_guestAccountTokens != null) {
      return _guestAccountTokens!;
    }
    Map guestAccountTokens = await _lock.synchronized(() async {
      if (_guestAccountTokens != null) {
        return _guestAccountTokens!;
      }
      var repository = await Repository.writable();

      int guestAccountIndex = _guestAccountIndex;
      var guestAccountDbData = await repository.query(tableGuestAccount, orderBy: 'created_at ASC', limit: 1);
      if (guestAccountDbData.isNotEmpty) {
        if (guestAccountDbData.length > guestAccountIndex) {
          var guestAccountDb = guestAccountDbData[guestAccountIndex];
          _guestAccountTokens = {
            'oauthConsumerKey': _oauthConsumerKey,
            'oauthConsumerSecret': _oauthConsumerSecret,
            'oauthToken': guestAccountDb['oauth_token'],
            'oauthTokenSecret': guestAccountDb['oauth_token_secret']
          };
          _guestAccountIndex = guestAccountIndex;
          return _guestAccountTokens!;
        }
      }

      String accessToken = await _getAccessToken();
      String guestToken = await _getGuestToken(accessToken);
      String flowToken = await _getFlowToken(accessToken, guestToken);
      var guestAccount = await _getGuestAccountFromTwitter(accessToken, guestToken, flowToken);
      _guestAccountTokens = {
        'oauthConsumerKey': _oauthConsumerKey,
        'oauthConsumerSecret': _oauthConsumerSecret,
        'oauthToken': guestAccount['oauth_token'],
        'oauthTokenSecret': guestAccount['oauth_token_secret']
      };

      await repository.insert(tableGuestAccount, guestAccount);
      return _guestAccountTokens!;
    });
    return guestAccountTokens;
  }

  static String hmacSHA1(String key, String text) {
    var hmacSha1 = Hmac(sha1, utf8.encode(key));
    var digest = hmacSha1.convert(utf8.encode(text));
    return base64.encode(digest.bytes);
  }

  static String nonce() {
    Random rnd = Random();
    List<int> values = List<int>.generate(32, (i) => rnd.nextInt(256));
    return base64.encode(values).replaceAll(RegExp('[=/+]'), '');
  }

  static Future<String> _getSignOauth(Uri uri, String method) async {
    Map guestAccountTokens = await _getGuestAccountTokens();
    Map<String,String> params = Map<String,String>.from(uri.queryParameters);
    params['oauth_version'] = '1.0';
    params['oauth_signature_method'] = 'HMAC-SHA1';
    params['oauth_consumer_key'] = guestAccountTokens['oauthConsumerKey'];
    params['oauth_token'] = guestAccountTokens['oauthToken'];
    params['oauth_nonce'] =  nonce();
    params['oauth_timestamp'] = (DateTime.now().millisecondsSinceEpoch / 1000).round().toString();
    String methodUp = method.toUpperCase();
    String link = Uri.encodeComponent('${uri.origin}${uri.path}');
    String paramsToSign = params.keys.sorted((a, b) => a.compareTo(b)).map((e) => '$e=${Uri.encodeComponent(params[e]!)}').join('&').replaceAll('+', '%20').replaceAll('%', '%25').replaceAll('=', '%3D').replaceAll('&', '%26');
    String toSign = '$methodUp&$link&$paramsToSign';
    //print('q=${params["q"]}');
    //print('toSign=$toSign');
    String signature = Uri.encodeComponent(hmacSHA1('${guestAccountTokens["oauthConsumerSecret"]}&${guestAccountTokens["oauthTokenSecret"]}', toSign));
    return 'OAuth realm="http://api.twitter.com/", oauth_version="1.0", oauth_token="${params["oauth_token"]}", oauth_nonce="${params["oauth_nonce"]}", oauth_timestamp="${params["oauth_timestamp"]}", oauth_signature="$signature", oauth_consumer_key="${params["oauth_consumer_key"]}", oauth_signature_method="HMAC-SHA1"';
  }

  static Future<http.Response> fetch(Uri uri, {Map<String, String>? headers}) async {
    if (_rateLimitRemaining.containsKey(uri.path) && _rateLimitRemaining[uri.path]! == 0) {
      throw RateLimitException('The request ${uri.path} has reached its limit. Please wait ${DateTime.fromMillisecondsSinceEpoch(_rateLimitReset[uri.path]!).difference(DateTime.now()).inMinutes} minutes.');
    }
    String authorization = await _getSignOauth(uri, 'GET');
    var response = await http.get(uri, headers: {
      ...?headers,
      'Authorization': authorization,
      'Content-Type': 'application/json',
      'User-Agent': 'TwitterAndroid/9.95.0-release.0 (29950000-r-0) ONEPLUS+A3010/9 (OnePlus;ONEPLUS+A3010;OnePlus;OnePlus3;0;;1;2016)',
      'X-Twitter-API-Version': '5',
      'X-Twitter-Client': 'TwitterAndroid',
      'X-Twitter-Client-Version': '9.95.0-release.0',
      'OS-Version': '28',
      'System-User-Agent': 'Dalvik/2.1.0 (Linux; U; Android 9; ONEPLUS A3010 Build/PKQ1.181203.001)',
      'X-Twitter-Active-User': 'yes'
    });

    var headerRateLimitRemaining = response.headers['x-rate-limit-remaining'];
    var headerRateLimitReset = response.headers['x-rate-limit-reset'];

    if (headerRateLimitRemaining == null || headerRateLimitReset == null) {
      return response;
    }

    _rateLimitRemaining[uri.path] = int.parse(headerRateLimitRemaining);
    _rateLimitReset[uri.path] = int.parse(headerRateLimitReset) * 1000;

    return response;
  }

}

class GuestAccountException implements Exception {
  final String message;

  GuestAccountException(this.message);

  @override
  String toString() {
    return message;
  }
}

class RateLimitException implements Exception {
  final String message;

  RateLimitException(this.message);

  @override
  String toString() {
    return message;
  }
}

class ExceptionResponse extends http.Response {
  final Exception exception;

  ExceptionResponse(this.exception) : super(exception.toString(), 500);

}

