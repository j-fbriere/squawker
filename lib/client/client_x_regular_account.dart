import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:squawker/client/headers.dart';
import 'package:squawker/database/repository.dart';

class XRegularAccount {
  static final log = Logger('XRegularAccount');

  static Future<http.Response> fetch(Uri uri,
      {Map<String, String>? headers,
      required Logger log,
      required Map<dynamic, dynamic> authHeader}) async {
    //log.info('Fetching $uri');

    final baseHeaders = await TwitterHeaders.getHeaders(uri);

    Map<String, String> h = {
      ...?headers,
      ...baseHeaders
    };
    /*
    print('*** request headers:');
    for (String k in h.keys) {
      print('$k=${h[k]}');
    }
    print('************');
    */
    var response = await http.get(uri, headers: h);
    /*
    print('*** response headers:');
    for (String k in response.headers.keys) {
      print('$k=${response.headers[k]}');
    }
    print('************');
    print('*** response body:');
    debugPrint(response.body, wrapWidth: 4096);
    print('************');
    */
    return response;
  }

  static Future<void> deleteAccount(String username) async {
    var database = await Repository.writable();
    await database.delete(tableAccounts, where: 'id = ?', whereArgs: [username]);
  }
}
