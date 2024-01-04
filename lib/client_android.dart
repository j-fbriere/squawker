import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:squawker/utils/iterables.dart';
import 'package:squawker/database/repository.dart';
import 'package:synchronized/synchronized.dart';

typedef ApplyRates = void Function(int remaining, int reset);

class TwitterAndroid {
  static final log = Logger('TwitterAndroid');

  static const String _oauthConsumerKey = '3nVuSoBZnx6U4vzUxf5w';
  static const String _oauthConsumerSecret = 'Bcs59EFbbsdF6Sl9Ng71smgStWEGwXXKSjYvPVt7qys';

  static final Lock _lock = Lock();
  static Map? _guestAccountTokens;
  static int _guestAccountIndex = 0;
  static Map<String,int> _rateLimitRemaining = {};
  static Map<String,int> _rateLimitReset = {};
  static bool _rateLimitsLoadedFromDb = false;

  static Future<void> loadRateLimits() async {
    var repository = await Repository.readOnly();
    var rateLimitsDbData = await repository.query(tableRateLimits);
    if (rateLimitsDbData.isNotEmpty) {
      _rateLimitsLoadedFromDb = true;
      String remainingData = rateLimitsDbData[0]['remaining'] as String;
      String resetData = rateLimitsDbData[0]['reset'] as String;
      Map<String,dynamic> rateLimitRemaining = json.decode(remainingData);
      _rateLimitRemaining = rateLimitRemaining.entries.fold({}, (prev, elm) {
        prev[elm.key] = elm.value;
        return prev;
      });
      Map<String,dynamic> rateLimitReset = json.decode(resetData);
      _rateLimitReset = rateLimitReset.entries.fold({}, (prev, elm) {
        prev[elm.key] = elm.value;
        return prev;
      });
    }
  }

  static Future<void> saveRateLimits() async {
    var repository = await Repository.writable();
    if (_rateLimitsLoadedFromDb) {
      repository.update(tableRateLimits, {'remaining': json.encode(_rateLimitRemaining), 'reset': json.encode(_rateLimitReset)});
    }
    else {
      repository.insert(tableRateLimits, {'remaining': json.encode(_rateLimitRemaining), 'reset': json.encode(_rateLimitReset)});
    }
  }

  static Future<String> _getAccessToken() async {
    String oauthConsumerKeySecret = base64.encode(utf8.encode('$_oauthConsumerKey:$_oauthConsumerSecret'));

    log.info('Posting https://api.twitter.com/oauth2/token');
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
    log.info('Posting https://api.twitter.com/1.1/guest/activate.json');
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
    log.info('Posting https://api.twitter.com/1.1/onboarding/task.json?flow_name=welcome');
    var response = await http.post(Uri.parse('https://api.twitter.com/1.1/onboarding/task.json?flow_name=welcome'),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
          'User-Agent': 'TwitterAndroid/10.10.0 (29950000-r-0) ONEPLUS+A3010/9 (OnePlus;ONEPLUS+A3010;OnePlus;OnePlus3;0;;1;2016)',
          'X-Guest-Token': guestToken,
          'X-Twitter-API-Version': '5',
          'X-Twitter-Client': 'TwitterAndroid',
          'X-Twitter-Client-Version': '10.10.0',
          'OS-Version': '28',
          'System-User-Agent': 'Dalvik/2.1.0 (Linux; U; Android 9; ONEPLUS A3010 Build/PKQ1.181203.001)',
          'X-Twitter-Active-User': 'yes',
        },
      body: json.encode({
        'flow_token': null,
        'input_flow_data': {
          'flow_context': {
            'start_location': {
              'location': 'splash_screen'
            }
          }
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
    log.info('Posting https://api.twitter.com/1.1/onboarding/task.json');
    var response = await http.post(Uri.parse('https://api.twitter.com/1.1/onboarding/task.json'),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
          'User-Agent': 'TwitterAndroid/10.10.0 (29950000-r-0) ONEPLUS+A3010/9 (OnePlus;ONEPLUS+A3010;OnePlus;OnePlus3;0;;1;2016)',
          'X-Guest-Token': guestToken,
          'X-Twitter-API-Version': '5',
          'X-Twitter-Client': 'TwitterAndroid',
          'X-Twitter-Client-Version': '10.10.0',
          'OS-Version': '28',
          'System-User-Agent': 'Dalvik/2.1.0 (Linux; U; Android 9; ONEPLUS A3010 Build/PKQ1.181203.001)',
          'X-Twitter-Active-User': 'yes',
        },
        body: json.encode({
          'flow_token': flowToken,
          'subtask_inputs': [{
            'open_link': {
              'link': 'next_link'
            },
            'subtask_id': 'NextTaskOpenLink'
          }
          ]
        })
    );

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      List? subtasks = result['subtasks'];
      if (subtasks != null) {
        var accountElm = subtasks.firstWhereOrNull((task) => task['subtask_id'] == 'OpenAccount');
        if (accountElm != null) {
          var account = accountElm['open_account'];
          log.info("Guest account created! oauth_token=${account['oauth_token']} oauth_token_secret=${account['oauth_token_secret']}");
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

  static Future<Map> _getGuestAccountTokens({forceNewAccount = false}) async {

    if (!forceNewAccount && _guestAccountTokens != null) {
      return _guestAccountTokens!;
    }
    Map? currentGuestAccountTokens = _guestAccountTokens;
    _guestAccountTokens = null;
    Map guestAccountTokens = await _lock.synchronized(() async {
      if (_guestAccountTokens != null) {
        return _guestAccountTokens!;
      }
      try {
        var repository = await Repository.writable();

        int guestAccountIndex = _guestAccountIndex;
        if (forceNewAccount) {
          guestAccountIndex++;
        }
        var guestAccountDbData = await repository.query(tableGuestAccount, orderBy: 'created_at ASC');
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
      }
      catch (err) {
        _guestAccountTokens = currentGuestAccountTokens;
        rethrow;
      }
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

  static Future<String> _getSignOauth(Uri uri, String method, {forceNewAccount = false}) async {
    Map guestAccountTokens = await _getGuestAccountTokens(forceNewAccount: forceNewAccount);
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

  static Future<http.Response> _doFetch(Uri uri, {Map<String, String>? headers, RateFetchContext? fetchContext, forceNewAccount = false}) async {
    fetchContext ??= RateFetchContext(1);
    try {
      if (_rateLimitRemaining.containsKey(uri.path) && _rateLimitRemaining[uri.path]! < fetchContext.total) {
        Duration d = DateTime.fromMillisecondsSinceEpoch(_rateLimitReset[uri.path]!).difference(DateTime.now());
        if (!d.isNegative) {
          throw RateLimitException('The request ${uri.path} has reached its limit. Please wait ${d.inMinutes} minutes.');
        }
      }
      String authorization = await _getSignOauth(uri, 'GET');
      var response = await http.get(uri, headers: {
        ...?headers,
        'Connection': 'Keep-Alive',
        'Authorization': authorization,
        'Content-Type': 'application/json',
        'X-Twitter-Active-User': 'yes',
        'Authority': 'api.twitter.com',
        'Accept-Encoding': 'gzip',
        'Accept-Language': 'en-US,en;q=0.9',
        'Accept': '*/*',
        'DNT': '1',
        'User-Agent': 'TwitterAndroid/10.10.0 (29950000-r-0) ONEPLUS+A3010/9 (OnePlus;ONEPLUS+A3010;OnePlus;OnePlus3;0;;1;2016)',
        'X-Twitter-API-Version': '5',
        'X-Twitter-Client': 'TwitterAndroid',
        'X-Twitter-Client-Version': '10.10.0',
        'OS-Version': '28',
        'System-User-Agent': 'Dalvik/2.1.0 (Linux; U; Android 9; ONEPLUS A3010 Build/PKQ1.181203.001)',
      });

      var headerRateLimitRemaining = response.headers['x-rate-limit-remaining'];
      var headerRateLimitReset = response.headers['x-rate-limit-reset'];

      if (headerRateLimitRemaining == null || headerRateLimitReset == null) {
        log.info('The request ${uri.path} has no rate limits.');
        fetchContext.fetchNoRate();
        return response;
      }

      fetchContext.fetchWithRate(int.parse(headerRateLimitRemaining), int.parse(headerRateLimitReset) * 1000, (remaining, reset) {
        _rateLimitRemaining[uri.path] = remaining;
        _rateLimitReset[uri.path] = reset;
      });

      return response;
    }
    catch (err) {
      log.severe('The request ${uri.path} has an error: ${err.toString()}');
      fetchContext.fetchNoRate();
      rethrow;
    }
  }

  static Future<http.Response> fetch(Uri uri, {Map<String, String>? headers, RateFetchContext? fetchContext}) async {
    http.Response rsp = await _doFetch(uri, headers: headers, fetchContext: fetchContext);
    if (rsp.statusCode == 429 && rsp.body.contains('Rate limit exceeded')) {
      log.info('The request ${uri.path} has a status 429 and exceeded its rate limit. Retrying.');
      rsp = await _doFetch(uri, headers: headers, fetchContext: fetchContext, forceNewAccount: true);
    }
    return rsp;
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

  @override
  String toString() {
    return exception.toString();
  }
}

class RateFetchContext {
  int total;
  int counter = 0;
  List<int?> remainingLst = [];
  List<int?> resetLst = [];

  RateFetchContext(this.total);

  void fetchNoRate() {
    counter++;
    remainingLst.add(null);
    resetLst.add(null);
  }

  void fetchWithRate(int remaining, int reset, ApplyRates callback) {
    counter++;
    remainingLst.add(remaining);
    resetLst.add(reset);
    if (counter == total) {
      int minRemaining = double.maxFinite.round();
      int minReset = 0;
      for (int i = 0; i < remainingLst.length; i++) {
        if (remainingLst[i] != null && remainingLst[i]! < minRemaining) {
          minRemaining = remainingLst[i]!;
          minReset = resetLst[i]!;
        }
      }
      callback(minRemaining, minReset);
    }
  }
}
