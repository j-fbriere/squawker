import 'dart:convert';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:squawker/client/accounts.dart';
import 'package:squawker/client/app_http_client.dart';
import 'package:squawker/client/client_guest_account.dart';
import 'package:squawker/client/client_regular_account.dart';
import 'package:squawker/client/client_x_regular_account.dart';
import 'package:squawker/client/client_unauthenticated.dart';
import 'package:squawker/client/headers.dart';
import 'package:squawker/constants.dart';
import 'package:squawker/database/entities.dart';
import 'package:squawker/database/repository.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:squawker/utils/crypto_util.dart';
import 'package:squawker/utils/iterables.dart';
import 'package:squawker/utils/misc.dart';
import 'package:synchronized/synchronized.dart';
import 'package:url_launcher/url_launcher_string.dart';


// now it is set to false. maybe forever.
const bool try_to_create_guest_account = false;

class TwitterAccount {
  static final log = Logger('TwitterAccount');

  static TwitterTokenEntity? _currentTwitterToken;
  static final List<TwitterProfileEntity> _twitterProfileLst = [];
  static final List<TwitterTokenEntity> _twitterTokenLst = [];
  static final Map<String,List<Map<String,int>>> _rateLimits = {};

  static BuildContext? _currentContext;
  static String? _currentLanguageCode;
  static String currentAccountTypes = twitterAccountTypesPriorityToRegular;

  static List<Account>? xAccountLst;

  static void setCurrentContext(BuildContext currentContext) {
    _currentContext = currentContext;
    _currentLanguageCode = Localizations.localeOf(currentContext).languageCode;
  }

  static int nbrGuestAccounts() {
    return _twitterTokenLst.where((e) => e.guest).length;
  }

  static List<TwitterTokenEntity> getRegularAccountsTokens() {
    return _twitterTokenLst.where((e) => !e.guest).toList();
  }

  static bool hasAccountAvailable() {
    //return nbrGuestAccounts() > 0 || getRegularAccountsTokens().isNotEmpty;
    return nbrGuestAccounts() > 0 || (xAccountLst?.isNotEmpty ?? false);
  }

  static Future<List<Account>> initCheckXAccounts({bool forceInit = false}) async {
    if (xAccountLst != null && !forceInit) {
      return xAccountLst!;
    }
    xAccountLst = await getAccounts();
    return xAccountLst!;
  }

  // this must be executed only once at the start of the application
  static Future<void> loadAllTwitterTokensAndRateLimits() async {
    var repository = await Repository.writable();

    // load the Twitter/X token list, sorted by creation ascending
    var twitterProfilesDbData = await repository.query(tableTwitterProfile);
    _twitterProfileLst.clear();
    for (int i = 0; i < twitterProfilesDbData.length; i++) {
      TwitterProfileEntity tpe = TwitterProfileEntity(
        username: twitterProfilesDbData[i]['username'] as String,
        password: twitterProfilesDbData[i]['password'] as String,
        createdAt: DateTime.parse(twitterProfilesDbData[i]['created_at'] as String),
        name: twitterProfilesDbData[i]['name'] as String?,
        email: twitterProfilesDbData[i]['email'] as String?,
        phone: twitterProfilesDbData[i]['phone'] as String?
      );
      if (tpe.username.isNotEmpty && tpe.password.isNotEmpty) {
        _twitterProfileLst.add(tpe);
      }
      else {
        // this should not happens, but you nerver know...
        // maybe there was some manipulation importing data?
      }
    }
    var twitterTokensDbData = await repository.query(tableTwitterToken);
    _twitterTokenLst.clear();
    for (int i = 0; i < twitterTokensDbData.length; i++) {
      TwitterTokenEntity tte = TwitterTokenEntity(
        guest: twitterTokensDbData[i]['guest'] == 1,
        idStr: twitterTokensDbData[i]['id_str'] as String,
        screenName: twitterTokensDbData[i]['screen_name'] as String,
        oauthToken: twitterTokensDbData[i]['oauth_token'] as String,
        oauthTokenSecret: twitterTokensDbData[i]['oauth_token_secret'] as String,
        createdAt: DateTime.parse(twitterTokensDbData[i]['created_at'] as String)
      );

      if (tte.oauthToken.isNotEmpty && tte.oauthTokenSecret.isNotEmpty) {
        if (!tte.guest) {
          TwitterProfileEntity? twitterProfile = _twitterProfileLst.firstWhereOrNull((e) => e.username == tte.screenName);
          if (twitterProfile != null) {
            tte.profile = twitterProfile;
            _twitterTokenLst.add(tte);
          }
          else {
            // this should not happens, but you nerver know...
            // maybe there was some manipulation importing data?
          }
        }
        else {
          _twitterTokenLst.add(tte);
        }
      }
      else {
        // this should not happens, but you nerver know...
        // maybe there was some manipulation importing data?
      }

    }
    if (_twitterTokenLst.isNotEmpty) {
      sortAccounts();

      // delete records from the rate_limits table that are not valid anymore (if applicable)
      List<String> oauthTokenLst = _twitterTokenLst.map((e) => e.oauthToken).toList();
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
    for (int i = 0; i < _twitterTokenLst.length; i++) {
      String oauthToken = _twitterTokenLst[i].oauthToken;
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

    if (_twitterTokenLst.isNotEmpty) {
      // TODO: remove eventually this call
      // temporary fix: it is possible that there are still expired tokens du to old version mismanagement
      await _deleteExpiredTokens();

      // TODO: remove eventually this call
      await _checkExpirationOfGuestTokens();
    }

  }

  static Future<void> initTwitterToken(String uriPath, int total) async {
    // first try to create a guest Twitter/X token if it's been at least 24 hours since the last creation
    // possibly will be removed in future versions
    TwitterAccountException? lastGuestAccountExc;
    if (try_to_create_guest_account) {
      DateTime? lastGuestTwitterTokenCreationAttempted = await _getLastGuestTwitterTokenCreationAttempted();
      if (lastGuestTwitterTokenCreationAttempted == null || DateTime
          .now()
          .difference(lastGuestTwitterTokenCreationAttempted)
          .inHours >= 24) {
        try {
          await _setLastGuestTwitterTokenCreationAttempted();
          await TwitterGuestAccount.createGuestTwitterToken();
        }
        on TwitterAccountException catch (ex) {
          log.warning('*** Try to create a guest Twitter/X token after 24 hours with error: ${ex.toString()}');
          lastGuestAccountExc = ex;
        }
      }
    }

    // possibly renew the tokens associated to the regular Twitter/X accounts
    await _renewProfilesTokens();

    // now find the first Twitter/X token that is available or at least with the minimum waiting time
    Map<String,dynamic>? twitterTokenInfo = await getNextTwitterTokenInfo(uriPath, total);
    if (twitterTokenInfo == null) {
      if (lastGuestAccountExc != null) {
        throw lastGuestAccountExc;
      }
      else {
        throw TwitterAccountException('There is a problem getting a Twitter/X token.');
      }
    }
    else if (twitterTokenInfo['twitterToken'] != null) {
      _currentTwitterToken = twitterTokenInfo['twitterToken'];
    }
    else if (twitterTokenInfo['minRateLimitReset'] != 0) {
      Map<String,dynamic> di = TwitterAccount.delayInfo(twitterTokenInfo['minRateLimitReset']);
      throw RateLimitException('The request $uriPath has reached its limit. Please wait ${di['minutesStr']}.', longDelay: di['longDelay']);
    }
    else {
      throw RateLimitException('There is a problem getting a Twitter/X token.');
    }
  }

  static void sortAccounts() {
    if (currentAccountTypes == twitterAccountTypesPriorityToRegular) {
      _twitterTokenLst.sort((a, b) {
        if (a.guest != b.guest) {
          return (a.guest ? 1 : 0) - (b.guest ? 1 : 0);
        }
        else {
          return a.createdAt.compareTo(b.createdAt);
        }
      });
    }
    else {
      _twitterTokenLst.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    }
    /*
    log.info('*** sort done:');
    for (int i = 0; i < _twitterTokenLst.length; i++) {
      log.info('*** oauthToken=${_twitterTokenLst[i].oauthToken}, guest=${_twitterTokenLst[i].guest}, createdAt=${DateFormat('yyy-MM-dd HH:mm:ss').format(_twitterTokenLst[i].createdAt)}');
    }
    */
  }

  // renew the regular Twitter/X account tokens after 30 days
  static Future<void> _renewProfilesTokens() async {
    for (int i = 0; i < _twitterProfileLst.length; i++) {
      TwitterProfileEntity tpe = _twitterProfileLst[i];
      TwitterTokenEntity? tte = _twitterTokenLst.firstWhereOrNull((e) => e.profile != null && e.profile!.username == tpe.username);
      if (tte != null) {
        if (DateTime.now().difference(tte.createdAt).inDays >= 30) {
          await TwitterRegularAccount.createRegularTwitterToken(_currentContext, _currentLanguageCode, tpe.username, tpe.password, tpe.name, tpe.email, tpe.phone);
          await deleteTwitterToken(tte);
        }
      }
    }
  }

  // TODO: remove eventually this method
  // temporary fix: it is possible that there are still expired tokens du to old version mismanagement
  static Future<void> _deleteExpiredTokens() async {
    List<TwitterTokenEntity> tokensToRemove = [];
    for (String oauthToken in _rateLimits.keys) {
      List<Map<String,int>> rateLimitsToken = _rateLimits[oauthToken] as List<Map<String,int>>;
      Map<String,int> rateLimitRemaining = rateLimitsToken[0];
      for (int remaining in rateLimitRemaining.values) {
        if (remaining == -2) {
          TwitterTokenEntity? tt = _twitterTokenLst.firstWhereOrNull((tt) => tt.oauthToken == oauthToken);
          if (tt != null) {
            tokensToRemove.add(tt);
          }
          break;
        }
      }
    }
    for (TwitterTokenEntity tt in tokensToRemove) {
      await deleteTwitterToken(tt);
    }
  }

  // TODO: remove eventually this method
  // Check if the guest tokens created more than 30 days ago are expired (and delete them if it is the case).
  // Check no more than 3 tokens to avoid a long wait.
  static Future<void> _checkExpirationOfGuestTokens() async {
    List<TwitterTokenEntity> lst = _twitterTokenLst.where((tt) => tt.guest && DateTime.now().difference(tt.createdAt).inDays > 30).toList();

    var queryParameters = {
      'id': '1'
    };
    for (int i = 0; i < 3 && i < lst.length; i++) {
      _currentTwitterToken = lst[i];
      try {
        Uri uri = Uri.https('api.twitter.com', '/1.1/trends/place.json', queryParameters);
        // no init of the fetchContext so that the current token won't be selected
        RateFetchContext fetchContext = RateFetchContext(uri.path, 1);
        // if the oauth token is expired, the delete token is taken care automatically
        await fetch(uri, fetchContext: fetchContext).timeout(Duration(seconds: 5));
      }
      catch (err, _) {
        // nothing to do
      }
    }
    _currentTwitterToken = null;
  }

  static Future<void> announcementRegularAccountAndUnauthenticatedAccess(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    // previous announcement
    if (prefs.containsKey('announcedRegularAccount')) {
      prefs.remove('announcedRegularAccount');
    }

    bool? announcedRegularAccountAndUnauthenticatedAccess = prefs.getBool('announcedRegularAccountAndUnauthenticatedAccess');
    if (announcedRegularAccountAndUnauthenticatedAccess ?? false) {
      return;
    }

    await showDialog<String?>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: const Icon(Symbols.warning),
          title: Text(L10n.current.warning_regular_account_unauthenticated_access_title),
          titleTextStyle: TextStyle(fontSize: Theme.of(context).textTheme.titleMedium!.fontSize, color: Theme.of(context).textTheme.titleMedium!.color, fontWeight: FontWeight.bold),
          content: Wrap(
            children: [
              Text(L10n.current.warning_regular_account_unauthenticated_access_description, style: TextStyle(fontSize: Theme.of(context).textTheme.labelMedium!.fontSize)),
              GestureDetector(
                child: Text('https://github.com/j-fbriere/squawker/wiki/3.-Regular-Twitter-X-accounts',
                  style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline, fontSize: Theme.of(context).textTheme.labelMedium!.fontSize),
                ),
                onTap: () async {
                  await launchUrlString('https://github.com/j-fbriere/squawker/wiki/3.-Regular-Twitter-X-accounts');
                },
              ),
            ]
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(L10n.current.ok),
            ),
          ]
        );
      }
    );
    await prefs.setBool('announcedRegularAccountAndUnauthenticatedAccess', true);
  }

  static Future<DateTime?> _getLastGuestTwitterTokenCreationAttempted() async {
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

  static Future<void> _setLastGuestTwitterTokenCreationAttempted() async {
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

  static Future<void> updateRateValues(String uriPath, int remaining, int reset) async {
    if (_currentTwitterToken == null) {
      // this should not happens
      return;
    }
    String oauthToken = _currentTwitterToken!.oauthToken;
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

  static Future<void> flushLastTwitterOauthToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('lastTwitterOauthToken');
  }

  static Future<Map<String,dynamic>?> getNextTwitterTokenInfo(String uriPath, int total) async {
    List<TwitterTokenEntity> filteredTwitterTokenLst = currentAccountTypes == twitterAccountTypesOnlyRegular ?
      _twitterTokenLst.where((e) => !e.guest).toList() :
      _twitterTokenLst;
    int minRateLimitReset = double.maxFinite.round();
    bool minResetSet = false;
    for (int idx = 0; idx < filteredTwitterTokenLst.length; idx++) {
      TwitterTokenEntity twitterToken = filteredTwitterTokenLst[idx];
      String oauthToken = twitterToken.oauthToken;
      int? rateLimitRemaining = _rateLimits[oauthToken]![0][uriPath];
      int? rateLimitReset = _rateLimits[oauthToken]![1][uriPath];
      if (rateLimitReset != null && rateLimitReset < minRateLimitReset) {
        minRateLimitReset = rateLimitReset;
        minResetSet = true;
      }
      if (rateLimitRemaining == null || (rateLimitRemaining == -1 && DateTime.now().isAfter(DateTime.fromMillisecondsSinceEpoch(rateLimitReset!))) || rateLimitRemaining >= total) {
        log.info('*** OAuth token chosen, created ${DateFormat('yyyy-MM-dd HH:mm:ss').format(twitterToken.createdAt)}');
        return {
          'twitterToken': twitterToken,
          'minRateLimitReset': null
        };
      }
    }
    if (minResetSet) {
      return {
        'twitterToken': null,
        'minRateLimitReset': minResetSet
      };
    }
    else {
      return null;
    }
  }

  static Future<void> deleteCurrentTwitterToken() async {
    if (_currentTwitterToken != null) {
      await deleteTwitterToken(_currentTwitterToken!);
      _currentTwitterToken = null;
    }
  }

  static Future<void> deleteTwitterToken(TwitterTokenEntity token) async {
    String oauthToken = token.oauthToken;
    log.info('*** Delete twitter token $oauthToken');

    _twitterTokenLst.removeWhere((tt) => tt.oauthToken == oauthToken);
    _rateLimits.removeWhere((key, value) => key == oauthToken);
    String? profileUsernameToDelete;
    if (!token.guest && token.profile != null) {
      if (_twitterTokenLst.firstWhereOrNull((tt) => !tt.guest && tt.profile!.username == token.profile!.username) == null) {
        profileUsernameToDelete = token.profile!.username;
        _twitterProfileLst.removeWhere((tp) => tp.username == token.profile!.username);
      }
    }

    var database = await Repository.writable();

    await database.delete(tableTwitterToken, where: 'oauth_token = ?', whereArgs: [oauthToken]);
    await database.delete(tableRateLimits, where: 'oauth_token = ?', whereArgs: [oauthToken]);
    if (profileUsernameToDelete != null) {
      await database.delete(tableTwitterProfile, where: 'username = ?', whereArgs: [profileUsernameToDelete]);
    }
  }

  static Future<void> addTwitterToken(TwitterTokenEntity twitterToken) async {
    _twitterTokenLst.add(twitterToken);
    String oauthToken = twitterToken.oauthToken;
    _rateLimits[oauthToken] = [{},{}];

    var repository = await Repository.writable();
    await repository.insert(tableTwitterToken, TwitterTokenEntityWrapperDb(twitterToken).toMap());
    await repository.insert(tableRateLimits, {'remaining': json.encode({}), 'reset': json.encode({}), 'oauth_token': oauthToken});
  }

  static Future<TwitterProfileEntity> getOrCreateProfile(String username, String password, String? name, String? email, String? phone) async {
    TwitterProfileEntity? tpe = _twitterProfileLst.firstWhereOrNull((e) => e.username == username);
    if (tpe != null) {
      return tpe;
    }
    tpe = TwitterProfileEntity(
      username: username,
      password: password,
      createdAt: DateTime.now(),
      name: name,
      email: email,
      phone: phone
    );
    _twitterProfileLst.add(tpe);

    var repository = await Repository.writable();
    await repository.insert(tableTwitterProfile, tpe.toMap());

    return tpe;
  }

  static TwitterProfileEntity? getProfile(String username) {
    return _twitterProfileLst.firstWhereOrNull((tp) => tp.username == username);
  }

  static Future<void> updateProfile(String username, String password, String? name, String? email, String? phone) async {
    TwitterProfileEntity? tpe = getProfile(username);
    if (tpe == null) {
      return;
    }
    tpe.password = password;
    tpe.name = name;
    tpe.email = email;
    tpe.phone = phone;

    var repository = await Repository.writable();
    await repository.update(tableTwitterProfile, {'password': password, 'name': name, 'email': email, 'phone': phone}, where: 'username = ?', whereArgs: [username]);
  }

  static Future<TwitterTokenEntity> createRegularTwitterToken(String username, String password, String? name, String? email, String? phone) async {
    TwitterTokenEntity? oldTte = _twitterTokenLst.firstWhereOrNull((e) => !e.guest && e.screenName == username);
    TwitterTokenEntity newTte = await TwitterRegularAccount.createRegularTwitterToken(_currentContext, _currentLanguageCode, username, password, name, email, phone);
    if (oldTte != null) {
      await deleteTwitterToken(oldTte);
    }
    return newTte;
  }

  static Future<String> getAccessToken() async {
    String oauthConsumerKeySecret = base64.encode(utf8.encode('$oauthConsumerKey:$oauthConsumerSecret'));

    log.info('Posting https://api.twitter.com/oauth2/token');
    var response = await AppHttpClient.httpPost(Uri.parse('https://api.twitter.com/oauth2/token'),
        headers: {
          'Authorization': 'Basic $oauthConsumerKeySecret',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: {
          'grant_type': 'client_credentials'
        }
    );

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      var result = jsonDecode(response.body);
      if (result.containsKey('access_token')) {
        return result['access_token'];
      }
    }

    throw TwitterAccountException('Unable to get the access token. The response (${response.statusCode}) from Twitter/X was: ${response.body}');
  }

  static Future<String> getGuestToken(String accessToken) async {
    log.info('Posting https://api.twitter.com/1.1/guest/activate.json');
    var response = await AppHttpClient.httpPost(Uri.parse('https://api.twitter.com/1.1/guest/activate.json'),
        headers: {
          'Authorization': 'Bearer $accessToken'
        }
    );

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      var result = jsonDecode(response.body);
      if (result.containsKey('guest_token')) {
        return result['guest_token'];
      }
    }

    throw TwitterAccountException('Unable to get the guest token. The response (${response.statusCode}) from Twitter/X was: ${response.body}');
  }

  static Map<String,String> initHeaders() {
    return {
      'Content-Type': 'application/json',
      'User-Agent': 'TwitterAndroid/10.10.0 (29950000-r-0) ONEPLUS+A3010/9 (OnePlus;ONEPLUS+A3010;OnePlus;OnePlus3;0;;1;2016)',
      'X-Twitter-API-Version': '5',
      'X-Twitter-Client': 'TwitterAndroid',
      'X-Twitter-Client-Version': '10.10.0',
      'OS-Version': '28',
      'System-User-Agent': 'Dalvik/2.1.0 (Linux; U; Android 9; ONEPLUS A3010 Build/PKQ1.181203.001)',
      'X-Twitter-Active-User': 'yes',
    };
  }

  static Future<String> _getSignOauth(Uri uri, String method) async {
    if (_currentTwitterToken == null) {
      throw TwitterAccountException('There is a problem getting a Twitter/X token.');
    }
    Map<String,String> params = Map<String,String>.from(uri.queryParameters);
    params['oauth_version'] = '1.0';
    params['oauth_signature_method'] = 'HMAC-SHA1';
    params['oauth_consumer_key'] = oauthConsumerKey;
    params['oauth_token'] = _currentTwitterToken!.oauthToken;
    params['oauth_nonce'] =  nonce();
    params['oauth_timestamp'] = (DateTime.now().millisecondsSinceEpoch / 1000).round().toString();
    String methodUp = method.toUpperCase();
    String link = Uri.encodeComponent('${uri.origin}${uri.path}');
    String paramsToSign = params.keys.sorted((a, b) => a.compareTo(b)).map((e) => '$e=${Uri.encodeComponent(params[e]!)}').join('&').replaceAll('+', '%20').replaceAll('%', '%25').replaceAll('=', '%3D').replaceAll('&', '%26');
    String toSign = '$methodUp&$link&$paramsToSign';
    //print('paramsToSign=$paramsToSign');
    //print('toSign=$toSign');
    String signature = Uri.encodeComponent(await hmacSHA1('$oauthConsumerSecret&${_currentTwitterToken!.oauthTokenSecret}', toSign));
    return 'OAuth realm="http://api.twitter.com/", oauth_version="1.0", oauth_token="${params["oauth_token"]}", oauth_nonce="${params["oauth_nonce"]}", oauth_timestamp="${params["oauth_timestamp"]}", oauth_signature="$signature", oauth_consumer_key="${params["oauth_consumer_key"]}", oauth_signature_method="HMAC-SHA1"';
  }

  static Future<http.Response> _doFetch(Uri uri, RateFetchContext fetchContext, {Map<String, String>? headers}) async {
    try {
      String authorization = await _getSignOauth(uri, 'GET');

      var response = await AppHttpClient.httpGet(uri, headers: {
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

  static Future<http.Response> _doFetchX(Uri uri, RateFetchContext fetchContext, {Map<String, String>? headers}) async {

    try {
      final authHeader = await TwitterHeaders.getAuthHeader();
      //print('*** _doFetchX authHeader:');
      //print(jsonEncode(authHeader));

      if (authHeader != null) {
        var response = await XRegularAccount.fetch(uri, headers: headers, log: log, authHeader: authHeader);

        //print('*** _doFetchX response:');
        //print(response.body);

        //await fetchContext.fetchWithResponse(response);

        return response;
      }
      else {
        return TwitterUnauthenticated.fetch(uri, headers: headers);
      }
    }
    catch (err) {
      log.severe('_doFetchX - The request ${uri.path} has an error: ${err.toString()}');
      await fetchContext.fetchNoResponse();
      rethrow;
    }

  }

  static Future<http.Response> fetch(Uri uri, {Map<String, String>? headers, RateFetchContext? fetchContext, bool allowUnauthenticated = false}) async {

    await initCheckXAccounts();

    if (allowUnauthenticated && !hasAccountAvailable()) {
      return TwitterUnauthenticated.fetch(uri, headers: headers);
    }


    if (fetchContext == null) {
      fetchContext = RateFetchContext(uri.path, 1);
      //await fetchContext.init();
    }

    http.Response rsp = await _doFetchX(uri, fetchContext, headers: headers);

    return rsp;
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

class TwitterAccountException implements Exception {
  final String message;

  TwitterAccountException(this.message);

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
    await TwitterAccount.initTwitterToken(uriPath, total);
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
      TwitterAccount.log.info('*** (From Twitter/X) headerRateLimitRemaining=$headerRateLimitRemaining, headerRateLimitReset=$headerRateLimitReset');
      if (response.statusCode == 401 && response.body.contains('Invalid or expired token')) {
        TwitterAccount.log.warning('*** (From Twitter/X) The request $uriPath has invalid or expired token.');
        remainingLst.add(-2);
        resetLst.add(0);
      }
      else if (headerRateLimitRemaining == null || headerRateLimitReset == null) {
        TwitterAccount.log.warning('*** (From Twitter/X) The request $uriPath has no rate limits.');
        remainingLst.add(null);
        resetLst.add(null);
      }
      else if (response.statusCode == 429 && response.body.contains('Rate limit exceeded')) {
        TwitterAccount.log.warning('*** (From Twitter/X) The request $uriPath has exceeded its rate limits.');
        remainingLst.add(-1);
        int reset = int.parse(headerRateLimitReset) * 1000;
        resetLst.add(reset);
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
    int minReset = -1;
    for (int i = 0; i < remainingLst.length; i++) {
      if (remainingLst[i] != null && remainingLst[i]! < minRemaining) {
        minRemaining = remainingLst[i]!;
        minReset = resetLst[i]!;
      }
    }
    if (minReset == -1) {
      return;
    }
    if (minRemaining == -2) {
      await TwitterAccount.deleteCurrentTwitterToken();
    }
    else {
      await TwitterAccount.updateRateValues(uriPath, minRemaining, minReset);
    }
    if (minRemaining <= -1) {
      // this should not happened but just in case, check if there is another guest account that is NOT with an embargo
      Map<String,dynamic>? twitterTokenInfoTmp = await TwitterAccount.getNextTwitterTokenInfo(uriPath, total);
      if (twitterTokenInfoTmp == null) {
        throw RateLimitException('There is a problem getting an account Twitter/X token.');
      }
      else {
        if (twitterTokenInfoTmp['twitterToken'] != null) {
          throw RateLimitException('The request $uriPath has reached its limit. Please wait 1 minute.');
        }
        else if (twitterTokenInfoTmp['minRateLimitReset'] != 0) {
          Map<String,dynamic> di = TwitterAccount.delayInfo(twitterTokenInfoTmp['minRateLimitReset']);
          throw RateLimitException('The request $uriPath has reached its limit. Please wait ${di['minutesStr']}.', longDelay: di['longDelay']);
        }
        else {
          throw RateLimitException('There is a problem getting a Twitter/X token.');
        }
      }
    }
  }

}

class TwitterTokensModel extends Store<List<TwitterTokenEntity>> {
  static final log = Logger('TwitterTokensModel');

  TwitterTokensModel() : super([]);

  Future<void> reloadTokens() async {
    log.info('Reload twitter tokens');

    await execute(() async {
      var database = await Repository.readOnly();

      List<TwitterProfileEntity> profileLst = (await database.query(tableTwitterProfile)).map((e) => TwitterProfileEntity.fromMap(e)).toList();
      List<TwitterTokenEntity> tokenLst = (await database.query(tableTwitterToken)).map((t) {
        TwitterTokenEntity tte = TwitterTokenEntity.fromMap(t);
        tte.profile = tte.guest ? null : profileLst.firstWhereOrNull((p) => p.username == tte.screenName);
        return tte;
      }).toList();
      return tokenLst;
    });
  }
}
