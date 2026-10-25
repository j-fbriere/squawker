import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:squawker/constants.dart';
import 'package:squawker/client/client_account.dart';
import 'package:squawker/database/entities.dart';
import 'package:squawker/database/repository.dart';
import 'package:squawker/utils/notifiers.dart';
import 'package:provider/provider.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class TwitterLoginWebview extends StatefulWidget {
  const TwitterLoginWebview({super.key});

  @override
  State<TwitterLoginWebview> createState() => _TwitterLoginWebviewState();
}

class _TwitterLoginWebviewState extends State<TwitterLoginWebview> {

  InAppWebViewController? _webViewController;
  final CookieManager _cookieManager = CookieManager.instance();

  String? _screenName;
  String? _csrfToken;
  Map<String, String>? _authHeader;
  bool _allCookiesDeleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
      ),
      body: InAppWebView(
        initialSettings: InAppWebViewSettings(
          userAgent: userAgentHeader['user-agent'],
          javaScriptEnabled: true,
        ),
        initialUrlRequest: URLRequest(
          url: WebUri.uri(Uri.https("x.com", "i/flow/login")),
        ),
        onWebViewCreated: (controller) {
          _webViewController = controller;
        },
        onLoadStart: (controller, url) async {
          if (!_allCookiesDeleted) {
            _allCookiesDeleted = true;
            await _cookieManager.deleteAllCookies();
          }
        },
        onLoadStop: (controller, url) async {
          if (url != null) {
            if ((_screenName?.isNotEmpty ?? false) && (_csrfToken?.isNotEmpty ?? false)) {
              return;
            }
            if (_screenName?.isEmpty ?? true) {
              String? screen_name = await controller.evaluateJavascript(
                source: "document.documentElement.outerHTML.match(/\"screen_name\":\"([^\"]+)\"/)?.[1] ?? '';"
              );

              if (screen_name?.isEmpty ?? true) {
                print("***** TwitterLoginWebview onLoadStop Found no screen_name");
                return;
              }
              _screenName = screen_name!.replaceAll('"', '');
              print('***** TwitterLoginWebview onLoadStop  found screen_name= $_screenName');
            }
            if (_csrfToken?.isEmpty ?? true) {
              List<Cookie> cookies = await _cookieManager.getCookies(url: url);

              for (var cookie in cookies) {
                if (cookie.name == 'ct0') {
                  _csrfToken = cookie.value;
                  print("***** TwitterLoginWebview onLoadStop Found CSRF Token (ct0): $_csrfToken");
                  break;
                }
              }
              if (_csrfToken != null) {
                _authHeader = {
                  "Cookie": cookies
                    .where((cookie) =>
                    cookie.name == "guest_id" ||
                    cookie.name == "gt" ||
                    cookie.name == "att" ||
                    cookie.name == "auth_token" ||
                    cookie.name == "ct0")
                    .map((cookie) => '${cookie.name}=${cookie.value}')
                    .join(";"),
                  "authorization": bearerToken,
                  "x-csrf-token": _csrfToken!,
                };
              }
              else {
                print("***** TwitterLoginWebview onLoadStop Found no CSRF Token (ct0)");
              }
            }
            if ((_screenName?.isNotEmpty ?? false) && (_csrfToken?.isNotEmpty ?? false)) {
              final database = await Repository.writable();
              await database.insert(tableAccounts, Account(id: _csrfToken!, screenName: _screenName!, authHeader: json.encode(_authHeader!)).toMap());
              await database.close();

              print('***** TwitterLoginWebview onLoadStop X user $_screenName added in database.');

              await TwitterAccount.initCheckXAccounts(forceInit: true);
              Provider.of<AccountAddedNotifier>(context, listen: false).publish();

              Navigator.pop(context);
            }
          }
        },
      ),
    );
  }
}
