import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:squawker/constants.dart';
import 'package:squawker/client/client_account.dart';
import 'package:squawker/database/entities.dart';
import 'package:squawker/database/repository.dart';
import 'package:squawker/utils/notifiers.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webview_cookie_manager_plus/webview_cookie_manager_plus.dart';

class TwitterLoginWebview extends StatefulWidget {
  const TwitterLoginWebview({super.key});

  @override
  State<TwitterLoginWebview> createState() => _TwitterLoginWebviewState();
}

class _TwitterLoginWebviewState extends State<TwitterLoginWebview> {

  bool _databaseSet = false;

  @override
  Widget build(BuildContext context) {
    WebViewPlatform.instance;
    final webviewCookieManager = WebviewCookieManager();
    final webviewController = WebViewController();
    webviewController.setJavaScriptMode(JavaScriptMode.unrestricted);
    webviewController.loadRequest(Uri.https("x.com", "i/flow/login"));
    webviewController.setUserAgent(userAgentHeader.toString());
    webviewController.setNavigationDelegate(NavigationDelegate(
      /*
      onPageFinished: (String url) async {
        //var screen_name = (await webviewController.runJavaScriptReturningResult("(window.__INITIAL_STATE__ ? (JSON.stringify(window.__INITIAL_STATE__).match(/\"screen_name\":\"[^\"]+\"/g)?.[0] ?? '') : '');")).toString();
        var screen_name = (await webviewController.runJavaScriptReturningResult("(window.__INITIAL_STATE__ ? JSON.stringify(window.__INITIAL_STATE__) : 'niet');")).toString();
        print('*** login onPageFinished:');
        print(url);
        if (screen_name != '') {
          print(screen_name);
        }
        else {
          print('nothing found :-(');
        }
      },
      */
      /*
      onPageFinished: (String url) async {
        var screen_name = (await webviewController.runJavaScriptReturningResult("document.documentElement.outerHTML.match(/\"screen_name\":\"[^\"]+\"/g)?.[0] ?? 'niet';")).toString();
        print('*** login onPageFinished:');
        print(url);
        if (screen_name != '') {
          print(screen_name);
        }
        else {
          print('nothing found :-(');
        }
      },
      */
      onUrlChange: (change) async {
        if (change.url == "https://x.com/home") {
          if (_databaseSet) {
            return;
          }
          final cookies = await webviewCookieManager.getCookies("https://x.com/i/flow/login");
          //print('*** login onUrlChange (https://x.com/home) cookies');
          //print(cookies.toString());

          /*
          //var screen_name = (await webviewController.runJavaScriptReturningResult("(window.__INITIAL_STATE__ ? (JSON.stringify(window.__INITIAL_STATE__).match(/\"screen_name\":\"[^\"]+\"/g)?.[0] ?? '') : '');")).toString();
          var screen_name = (await webviewController.runJavaScriptReturningResult("(window.__INITIAL_STATE__ ? JSON.stringify(window.__INITIAL_STATE__) : 'niet');")).toString();
          if (screen_name != '') {
            print(screen_name);
          }
          else {
            print('nothing found :-(');
          }
          */

          try {
            final expCt0 = RegExp(r'(ct0=(.+?));');
            final RegExpMatch? matchCt0 = expCt0.firstMatch(cookies.toString());
            final csrfToken = matchCt0?.group(2);
            if (csrfToken != null) {
              final Map<String, String> authHeader = {
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
                "x-csrf-token": csrfToken,
              };

              print(authHeader);

              final database = await Repository.writable();
              await database.insert(tableAccounts, Account(id: csrfToken, authHeader: json.encode(authHeader)).toMap());
              await database.close();

              _databaseSet = true;
              await TwitterAccount.initCheckXAccounts(forceInit: true);
              Provider.of<AccountAddedNotifier>(context, listen: false).publish();
            }
            Navigator.pop(context);
          } catch (e) {
            throw Exception(e);
          }
        }
      },
    ));
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
      ),
      body: WebViewWidget(
        controller: webviewController,
      ),
    );
  }
}
