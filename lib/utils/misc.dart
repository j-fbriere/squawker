import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

const androidChannel = MethodChannel('squawker/android_info');

List<String>? _supportedTextActivityList;

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

String? cached_public_ip;

// reference: https://stackoverflow.com/questions/60180934/how-to-get-public-ip-in-flutter
Future<String?> getPublicIP() async {
  try {
    if (cached_public_ip != null) {
      return cached_public_ip;
    }
    var url = Uri.parse('https://api.ipify.org');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // The response body is the IP in plain text, so just
      // return it as-is.
      cached_public_ip = response.body;
      return cached_public_ip;
    }
    else {
      // The request failed with a non-200 code
      // The ipify.org API has a lot of guaranteed uptime
      // promises, so this shouldn't ever actually happen.
      print(response.statusCode);
      print(response.body);
      return null;
    }
  }
  catch (e) {
    // Request failed due to an error, most likely because
    // the phone isn't connected to the internet.
    print(e);
    return null;
  }
}

// values used: dev, github, fdroid, play
String getFlavor() {
  const flavor = String.fromEnvironment('app.flavor');

  if (flavor == '') {
    return 'dev';
  }

  return flavor;
}

bool findInJSONArray(List arr, String key, String value) {
  for (var item in arr) {
    if (item[key] == value) {
      return true;
    }
  }
  return false;
}

bool isTranslatable(String? lang, String? text) {
  if (lang == null || lang == 'und') {
    return false;
  }

  if (lang != getShortSystemLocale()) {
    return true;
  }

  return false;
}

String getShortSystemLocale() {
  // TODO: Cache
  return Platform.localeName.split("_")[0];
}

Future<List<String>> getSupportedTextActivityList() async {
  if (!Platform.isAndroid) {
    return [];
  }
  if (_supportedTextActivityList != null) {
    return _supportedTextActivityList!;
  }
  _supportedTextActivityList = (await androidChannel.invokeMethod('supportedTextActivityList') as List<Object?>).map((e) => e.toString()).toList();
  /*
  print('*** supported text activities:');
  _supportedTextActivityList!.forEach((e) { print('***   $e'); });
  */
  return _supportedTextActivityList!;
}

Future<String?> processTextActivity(int index, String value, bool readonly) async {
  if (!Platform.isAndroid) {
    return null;
  }
  String? newValue = await androidChannel.invokeMethod('processTextActivity', {
    'id': index,
    'value': value,
    'readonly': readonly,
  }) as String?;
  return newValue;
}

Future requestPostNotificationsPermissions(AsyncCallback callback) async {
  if (!Platform.isAndroid) {
    callback();
    return;
  }
  androidChannel.setMethodCallHandler((MethodCall call) async {
    if (call.method == 'requestPostNotificationsPermissionsCallback') {
      bool granted = call.arguments;
      if (granted) {
        callback();
      }
    }
    return true;
  });
  await androidChannel.invokeMethod('requestPostNotificationsPermissions');
}

