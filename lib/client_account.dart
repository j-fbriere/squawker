import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:squawker/utils/iterables.dart';
import 'package:squawker/utils/misc.dart';
import 'package:squawker/database/entities.dart';
import 'package:squawker/database/repository.dart';
import 'package:synchronized/synchronized.dart';

typedef ApplyRates = Future<void> Function(int remaining, int reset);

class TwitterAccount {
  static final log = Logger('TwitterAccount');

  static const String _oauthConsumerKey = '3nVuSoBZnx6U4vzUxf5w';
  static const String _oauthConsumerSecret = 'Bcs59EFbbsdF6Sl9Ng71smgStWEGwXXKSjYvPVt7qys';

  static Map? _guestAccountTokens;
  static final List<Map<String,Object?>> _guestAccountTokensLst = [];
  static final Map<String,List<Map<String,int>>> _rateLimits = {};

  // this must be executed only once at the start of the application
  static Future<void> loadAllGuestAccountsAndRateLimits() async {
    var repository = await Repository.writable();

    // load the guest account tokens list, sorted by creation ascending
    var guestAccountsDbData = await repository.query(tableGuestAccount);
    _guestAccountTokensLst.clear();
    for (int i = 0; i < guestAccountsDbData.length; i++) {
      _guestAccountTokensLst.add({
        'idStr': guestAccountsDbData[i]['id_str'],
        'screenName': guestAccountsDbData[i]['screen_name'],
        'oauthToken': guestAccountsDbData[i]['oauth_token'],
        'oauthTokenSecret': guestAccountsDbData[i]['oauth_token_secret'],
        'createdAt': DateTime.parse(guestAccountsDbData[i]['created_at'] as String),
      });
    }
    if (_guestAccountTokensLst.isNotEmpty) {
      _guestAccountTokensLst.sort((a, b) => (a['createdAt'] as DateTime).compareTo(b['createdAt'] as DateTime));

      // delete records from the rate_limits table that are not valid anymore (if applicable)
      List<String> oauthTokenLst = _guestAccountTokensLst.map((e) => e['oauthToken'] as String).toList();
      await repository.delete(tableRateLimits, where: 'oauth_token IS NOT NULL AND oauth_token NOT IN (${List.filled(oauthTokenLst.length, '?').join(',')})', whereArgs: oauthTokenLst);
    }

    // load the rate limits
    var rateLimitsDbData = await repository.query(tableRateLimits);
    _rateLimits.clear();
    List<String> oauthTokenFoundLst = [];
    for (int i = 0; i < rateLimitsDbData.length; i++) {
      String oauthToken = (rateLimitsDbData[i]['oauth_token'] ?? '') as String;
      oauthTokenFoundLst.add(oauthToken);
      String remainingData = rateLimitsDbData[i]['remaining'] as String;
      String resetData = rateLimitsDbData[i]['reset'] as String;
      Map<String,dynamic> jRateLimitRemaining = json.decode(remainingData);
      Map<String,int> rateLimitRemaining = jRateLimitRemaining.entries.fold({}, (prev, elm) {
        prev[elm.key] = elm.value;
        return prev;
      });
      Map<String,dynamic> jRateLimitReset = json.decode(resetData);
      Map<String,int> rateLimitReset = jRateLimitReset.entries.fold({}, (prev, elm) {
        prev[elm.key] = elm.value;
        return prev;
      });
      List<Map<String,int>> lst = [];
      lst.add(rateLimitRemaining);
      lst.add(rateLimitReset);
      _rateLimits[oauthToken] = lst;
    }
    // if there are accounts without their rate limits, initialize them
    for (int i = 0; i < _guestAccountTokensLst.length; i++) {
      String oauthToken = _guestAccountTokensLst[i]['oauthToken'] as String;
      if (!oauthTokenFoundLst.contains(oauthToken)) {
        _rateLimits[oauthToken] = [{},{}];
        await repository.insert(tableRateLimits, {'remaining': json.encode({}), 'reset': json.encode({}), 'oauth_token': oauthToken});
      }
    }
    // if there is the rate limits block associated with the "null" oauthToken (after migration from 3.5.4)
    // associate it with a available non-null oauthToken, then delete the block
    if (_rateLimits.keys.contains('')) {
      MapEntry<String,List<Map<String,int>>>? merl = _rateLimits.entries.firstWhereOrNull((e) => e.key != '' && e.value[0].isEmpty);
      if (merl != null) {
        _rateLimits[merl.key] = _rateLimits[''] as List<Map<String,int>>;
        _rateLimits.remove('');
        await repository.delete(tableRateLimits, where: 'oauth_token IS NULL');
      }
    }
  }

  static Future<DateTime?> getLastGuestAccountCreationAttempted() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? lastGuestAccountsCreationAttemptedLst = prefs.getStringList('lastGuestAccountsCreationsAttempted');
    if (lastGuestAccountsCreationAttemptedLst == null) {
      return null;
    }
    String? publicIP = await getPublicIP();
    if (publicIP == null) {
      return null;
    }
    String? ipLastGuestAccountsCreationAttemptedStr = lastGuestAccountsCreationAttemptedLst.firstWhereOrNull((e) => e.startsWith('$publicIP='));
    if (ipLastGuestAccountsCreationAttemptedStr == null) {
      return null;
    }
    String lastGuestAccountsCreationAttemptedStr = ipLastGuestAccountsCreationAttemptedStr.substring('$publicIP='.length);
    return DateTime.parse(lastGuestAccountsCreationAttemptedStr);
  }

  static Future<void> setLastGuestAccountCreationAttempted() async {
    String? publicIP = await getPublicIP();
    if (publicIP == null) {
      return;
    }
    final prefs = await SharedPreferences.getInstance();
    List<String> lastGuestAccountsCreationAttemptedLst = prefs.getStringList('lastGuestAccountsCreationsAttempted') ?? [];
    int idx = lastGuestAccountsCreationAttemptedLst.indexWhere((e) => e.startsWith('$publicIP='));
    if (idx != -1) {
      lastGuestAccountsCreationAttemptedLst.removeAt(idx);
    }
    String ipLastGuestAccountsCreationAttemptedStr = '$publicIP=${DateTime.now().toIso8601String()}';
    lastGuestAccountsCreationAttemptedLst.add(ipLastGuestAccountsCreationAttemptedStr);
    prefs.setStringList('lastGuestAccountsCreationsAttempted', lastGuestAccountsCreationAttemptedLst);
  }

  static Future<void> initGuestAccount(String uriPath, int total) async {
    // first try to create a guest account if it's been at least 24 hours since the last creation
    GuestAccountException? lastGuestAccountExc;
    DateTime? lastGuestAccountCreationAttempted = await getLastGuestAccountCreationAttempted();
    if (lastGuestAccountCreationAttempted == null || DateTime.now().difference(lastGuestAccountCreationAttempted).inHours >= 24) {
      try {
        await setLastGuestAccountCreationAttempted();
        Map<String,Object?> guestAccount = await _createGuestAccountTokens();
        _guestAccountTokensLst.add(guestAccount);
        String oauthToken = guestAccount['oauthToken'] as String;
        _rateLimits[oauthToken] = [{},{}];
      }
      on GuestAccountException catch (_, ex) {
        log.warning('*** Try to create a guest account after 24 hours with error: ${_.toString()}');
        lastGuestAccountExc = _;
      }
    }

    // now find the first guest account that is available or at least with the minimum waiting time
    Map<String,dynamic>? guestAccountInfo = getNextGuestAccount(uriPath, total);
    if (guestAccountInfo == null) {
      if (lastGuestAccountExc != null) {
        throw lastGuestAccountExc;
      }
      else {
        throw GuestAccountException('There is a problem getting a guest account.');
      }
    }
    else if (guestAccountInfo['guestAccount'] != null) {
      _guestAccountTokens = guestAccountInfo['guestAccount'];
    }
    else {
      Map<String,dynamic> di = delayInfo(guestAccountInfo['minRateLimitReset']);
      throw RateLimitException('The request $uriPath has reached its limit. Please wait ${di['minutesStr']}.', longDelay: di['longDelay']);
    }
  }

  static Map<String,dynamic> delayInfo(int targetDateTime) {
    Duration d = DateTime.fromMillisecondsSinceEpoch(targetDateTime).difference(DateTime.now());
    String minutesStr;
    if (!d.isNegative) {
      if (d.inMinutes > 59) {
        int minutes = d.inMinutes % 60;
        minutesStr = minutes > 1 ? '$minutes minutes' : '1 minute';
        minutesStr = d.inHours > 1 ? '${d.inHours} hours, $minutesStr' : '1 hour, $minutesStr';
      }
      else {
        minutesStr = d.inMinutes > 1 ? '${d.inMinutes} minutes' : '1 minute';
      }
    }
    else {
      d = const Duration(minutes: 1);
      minutesStr = '1 minute';
    }
    return {
      'minutesStr': minutesStr,
      'longDelay': d.inMinutes > 30
    };
  }

  static Map<String,dynamic>? getNextGuestAccount(String uriPath, int total) {
    int minRateLimitReset = double.maxFinite.round();
    bool minResetSet = false;
    for (int i = 0; i < _guestAccountTokensLst.length; i++) {
      Map<String,Object?> guestAccount = _guestAccountTokensLst[i];
      String oauthToken = guestAccount['oauthToken'] as String;
      int? rateLimitRemaining = _rateLimits[oauthToken]![0][uriPath];
      int? rateLimitReset = _rateLimits[oauthToken]![1][uriPath];
      if (rateLimitReset != null && rateLimitReset < minRateLimitReset) {
        minRateLimitReset = rateLimitReset;
        minResetSet = true;
      }
      if (rateLimitRemaining == null || rateLimitRemaining >= total) {
        return {
          'guestAccount': guestAccount,
          'minRateLimitReset': null
        };
      }
    }
    if (minResetSet) {
      return {
        'guestAccount': null,
        'minRateLimitReset': minResetSet
      };
    }
    else {
      return null;
    }
  }

  static Future<void> updateRateValues(String uriPath, int remaining, int reset) async {
    if (_guestAccountTokens == null) {
      // this should not happens
      return;
    }
    String oauthToken = _guestAccountTokens!['oauthToken'];
    if (_rateLimits[oauthToken] == null) {
      // this should not happens
      return;
    }
    List<Map<String,int>> rateLimitsToken = _rateLimits[oauthToken]!;
    Map<String,int> rateLimitRemaining = rateLimitsToken[0];
    Map<String,int> rateLimitReset = rateLimitsToken[1];
    rateLimitRemaining[uriPath] = remaining;
    rateLimitReset[uriPath] = reset;
    var repository = await Repository.writable();
    await repository.update(tableRateLimits, {'remaining': json.encode(rateLimitRemaining), 'reset': json.encode(rateLimitReset)}, where: 'oauth_token = ?', whereArgs: [ oauthToken ]);
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

  static Future<Map<String,Object?>> _getGuestAccountFromTwitter(String accessToken, String guestToken, String flowToken) async {
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
            'oauth_token_secret': account['oauth_token_secret'],
            'created_at': DateTime.now().toIso8601String()
          };
        }
      }
    }

    throw GuestAccountException('Unable to create the guest account. The response (${response.statusCode}) from Twitter was: ${response.body}');
  }

  static Future<Map<String,Object?>> _createGuestAccountTokens() async {
    String accessToken = await _getAccessToken();
    String guestToken = await _getGuestToken(accessToken);
    String flowToken = await _getFlowToken(accessToken, guestToken);
    Map<String,Object?> guestAccount = await _getGuestAccountFromTwitter(accessToken, guestToken, flowToken);

    var repository = await Repository.writable();
    await repository.insert(tableGuestAccount, guestAccount);
    await repository.insert(tableRateLimits, {'remaining': json.encode({}), 'reset': json.encode({}), 'oauth_token': guestAccount['oauth_token']});
    return {
      'idStr': guestAccount['id_str'],
      'screenName': guestAccount['screen_name'],
      'oauthToken': guestAccount['oauth_token'],
      'oauthTokenSecret': guestAccount['oauth_token_secret'],
      'createdAt': DateTime.parse(guestAccount['created_at'] as String)
    };
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
    if (_guestAccountTokens == null) {
      throw GuestAccountException('There is a problem getting a guest account.');
    }
    Map guestAccountTokens = _guestAccountTokens!;
    Map<String,String> params = Map<String,String>.from(uri.queryParameters);
    params['oauth_version'] = '1.0';
    params['oauth_signature_method'] = 'HMAC-SHA1';
    params['oauth_consumer_key'] = _oauthConsumerKey;
    params['oauth_token'] = guestAccountTokens['oauthToken'];
    params['oauth_nonce'] =  nonce();
    params['oauth_timestamp'] = (DateTime.now().millisecondsSinceEpoch / 1000).round().toString();
    String methodUp = method.toUpperCase();
    String link = Uri.encodeComponent('${uri.origin}${uri.path}');
    String paramsToSign = params.keys.sorted((a, b) => a.compareTo(b)).map((e) => '$e=${Uri.encodeComponent(params[e]!)}').join('&').replaceAll('+', '%20').replaceAll('%', '%25').replaceAll('=', '%3D').replaceAll('&', '%26');
    String toSign = '$methodUp&$link&$paramsToSign';
    //print('q=${params["q"]}');
    //print('toSign=$toSign');
    String signature = Uri.encodeComponent(hmacSHA1('$_oauthConsumerSecret&${guestAccountTokens["oauthTokenSecret"]}', toSign));
    return 'OAuth realm="http://api.twitter.com/", oauth_version="1.0", oauth_token="${params["oauth_token"]}", oauth_nonce="${params["oauth_nonce"]}", oauth_timestamp="${params["oauth_timestamp"]}", oauth_signature="$signature", oauth_consumer_key="${params["oauth_consumer_key"]}", oauth_signature_method="HMAC-SHA1"';
  }

  static Future<http.Response> _doFetch(Uri uri, RateFetchContext fetchContext, {Map<String, String>? headers}) async {
    try {
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

      await fetchContext.fetchWithResponse(response);

      return response;
    }
    catch (err) {
      log.severe('_doFetch - The request ${uri.path} has an error: ${err.toString()}');
      await fetchContext.fetchNoResponse();
      rethrow;
    }
  }

  static Future<http.Response> fetch(Uri uri, {Map<String, String>? headers, RateFetchContext? fetchContext}) async {
    if (fetchContext == null) {
      fetchContext = RateFetchContext(uri.path, 1);
      await fetchContext.init();
    }

    http.Response rsp = await _doFetch(uri, fetchContext, headers: headers);

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
  final bool longDelay;

  RateLimitException(this.message, {this.longDelay = false});

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
  String uriPath;
  int total;
  int counter = 0;
  List<int?> remainingLst = [];
  List<int?> resetLst = [];
  Lock lock = Lock();

  RateFetchContext(this.uriPath, this.total);

  Future<void> init() async {
    await TwitterAccount.initGuestAccount(uriPath, total);
  }

  Future<void> fetchNoResponse() async {
    await lock.synchronized(() async {
      if (counter == total) {
        return;
      }
      counter++;
      remainingLst.add(null);
      resetLst.add(null);
      await _checkTotal();
    });
  }

  Future<void> fetchWithResponse(http.Response response) async {
    await lock.synchronized(() async {
      if (counter == total) {
        return;
      }
      counter++;
      var headerRateLimitRemaining = response.headers['x-rate-limit-remaining'];
      var headerRateLimitReset = response.headers['x-rate-limit-reset'];
      TwitterAccount.log.info('*** headerRateLimitRemaining=$headerRateLimitRemaining, headerRateLimitReset=$headerRateLimitReset');
      if (headerRateLimitRemaining == null || headerRateLimitReset == null) {
        TwitterAccount.log.info('The request $uriPath has no rate limits.');
        remainingLst.add(null);
        resetLst.add(null);
      }
      else if (response.statusCode == 429 && response.body.contains('Rate limit exceeded')) {
        // Twitter/X API documentation specify a 24 hours waiting time, but I experimented a 12 hours embargo.
        remainingLst.add(-1);
        resetLst.add(DateTime.now().add(const Duration(hours: 12)).millisecondsSinceEpoch);
      }
      else {
        int remaining = int.parse(headerRateLimitRemaining);
        int reset = int.parse(headerRateLimitReset) * 1000;
        remainingLst.add(remaining);
        resetLst.add(reset);
      }
      await _checkTotal();
    });
  }

  Future<void> _checkTotal() async {
    if (counter < total) {
      return;
    }
    int minRemaining = double.maxFinite.round();
    int minReset = 0;
    for (int i = 0; i < remainingLst.length; i++) {
      if (remainingLst[i] != null && remainingLst[i]! < minRemaining) {
        minRemaining = remainingLst[i]!;
        minReset = resetLst[i]!;
      }
    }
    if (minReset == 0) {
      return;
    }
    await TwitterAccount.updateRateValues(uriPath, minRemaining, minReset);
    if (minRemaining == -1) {
      // this should not happened but just in case, check if there is another guest account that is NOT with an embargo
      Map<String,dynamic>? guestAccountInfoTmp = TwitterAccount.getNextGuestAccount(uriPath, total);
      if (guestAccountInfoTmp!['guestAccount'] != null) {
        throw RateLimitException('The request $uriPath has reached its limit. Please wait 1 minute.');
      }
      else {
        Map<String,dynamic> di = TwitterAccount.delayInfo(guestAccountInfoTmp['minRateLimitReset']);
        throw RateLimitException('The request $uriPath has reached its limit. Please wait ${di['minutesStr']}.', longDelay: di['longDelay']);
      }
    }
  }

}

class GuestAccountsModel extends Store<List<GuestAccount>> {
  static final log = Logger('GuestAccountsModel');

  GuestAccountsModel() : super([]);

  Future<void> reloadGuestAccounts() async {
    log.info('Listing guest accounts');

    await execute(() async {
      var database = await Repository.readOnly();

      return (await database.query(tableGuestAccount)).map((e) => GuestAccount.fromMap(e)).toList();
    });
  }

  Future<void> deleteOldAccounts() async {
    log.info('Deleting old guest accounts');

    await execute(() async {
      var database = await Repository.writable();

      await database.delete(tableGuestAccount, where: "created_at < date('now', '-25 day')");
      return (await database.query(tableGuestAccount)).map((e) => GuestAccount.fromMap(e)).toList();
    });
  }

}
