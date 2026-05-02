import 'dart:convert';
import 'dart:math';
import 'package:squawker/database/entities.dart';
import 'package:squawker/client/x_client_transaction_id/client_transaction.dart';
import 'package:squawker/constants.dart';

import 'accounts.dart';

class TwitterHeaders {
  static final Map<String, String> _baseHeaders = {
    'accept': '*/*',
    'accept-language': 'en-US,en;q=0.9',
    'authorization': bearerToken,
    'cache-control': 'no-cache',
    'content-type': 'application/json',
    'pragma': 'no-cache',
    'priority': 'u=1, i',
    'referer': 'https://x.com',
    'origin': 'https://x.com',
    'user-agent': userAgentHeader['user-agent']!,
    'sec-ch-ua': '"Google Chrome";v="142", "Chromium";v="142", "Not A(Brand";v="24"',
    'x-twitter-active-user': 'yes',
    'x-twitter-client-language': 'en',
    'x-twitter-auth-type': 'OAuth2Session',
  };

  static Future<ClientTransaction>? _futureInitialize;

  static Future<Map<String, String>?> getXClientTransactionIdHeader(Uri? uri) async {
    try {
      if (uri == null) {
        return null;
      }

      _futureInitialize ??= ClientTransaction.initialize();
      final ct = await _futureInitialize!;
      return {
        'x-client-transaction-id': ct.generateTransactionId('GET', uri.path)
      };
    }
    catch (e) {
      throw Exception('Error getting x-client-transaction-id: $e');
    }
  }

  static Future<Map<String, String>> getHeaders(Uri? uri) async {
    final authHeader = await getAuthHeader();
    final xClientTransactionIdHeader = await getXClientTransactionIdHeader(uri);
    return {
      ..._baseHeaders,
      ...?authHeader,
      ...?xClientTransactionIdHeader
    };
  }

  static Future<Map<dynamic, dynamic>?> getAuthHeader() async {
    final accounts = await getAccounts();
    if(accounts.isEmpty) {
      return null;
    }
    Account account = accounts[Random().nextInt(accounts.length)];
    final authHeader = Map.castFrom<String, dynamic, String, String>(json.decode(account.authHeader));
    return authHeader;
  }
}
