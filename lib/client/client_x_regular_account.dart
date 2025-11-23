import 'dart:async';
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
    log.info('Fetching $uri');

    final baseHeaders = await TwitterHeaders.getHeaders(uri);

    var response = await http.get(uri, headers: {
      ...?headers,
      ...baseHeaders
    });

    return response;
  }

  static Future<void> deleteAccount(String username) async {
    var database = await Repository.writable();
    await database.delete(tableAccounts, where: 'id = ?', whereArgs: [username]);
  }
}
