import 'dart:async';
import 'dart:io';

import 'package:async_button_builder/async_button_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:squawker/client.dart';
import 'package:squawker/constants.dart';
import 'package:squawker/generated/l10n.dart';

void showSnackBar(BuildContext context, {required String icon, required String message, bool clearBefore = true}) {
  if (clearBefore) {
    ScaffoldMessenger.of(context).clearSnackBars();
  }

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(child: Text(message, style: const TextStyle(height: 1.5))),
        Text(icon),
      ],
    ),
  ));
}

abstract class FritterErrorWidget extends StatelessWidget {
  const FritterErrorWidget({Key? key}) : super(key: key);
}

class UnknownTwitterErrorCode implements Exception {
  final int code;
  final String message;
  final String uri;

  UnknownTwitterErrorCode(this.code, this.message, this.uri);

  @override
  String toString() {
    return 'Unknown Twitter error code: {code: $code, message: $message, uri: $uri}';
  }
}

EmojiErrorWidget createEmojiError(TwitterError error) {
  String emoji;
  String message;

  switch (error.code) {
    case 22:
      emoji = '🔒';
      message = L10n.current.private_profile;
      break;
    case 34:
      emoji = '🤔';
      message = L10n.current.page_not_found;
      break;
    case 50:
      emoji = '🕵️';
      message = L10n.current.user_not_found;
      break;
    case 63:
      emoji = '👮';
      message = L10n.current.account_suspended;
      break;
    case 200:
      emoji = '⛔';
      message = L10n.current.forbidden;
      break;
    case 239:
      emoji = '💩';
      message = L10n.current.bad_guest_token;
      break;
    default:
      emoji = '💥';
      message = L10n.current.catastrophic_failure;
      break;
  }

  return EmojiErrorWidget(emoji: emoji, message: message, errorMessage: error.message);
}

class EmojiErrorWidget extends FritterErrorWidget {
  final String emoji;
  final String message;
  final String errorMessage;
  final Function? onRetry;
  String retryText = '';
  final bool showBackButton;

  EmojiErrorWidget(
      {Key? key,
      required this.emoji,
      required this.message,
      required this.errorMessage,
      this.onRetry,
      String? retryText,
      this.showBackButton = true})
      : super(key: key) {
    this.retryText = retryText ?? L10n.current.retry;
  }

  @override
  Widget build(BuildContext context) {
    var onRetry = this.onRetry;

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Text(emoji, style: const TextStyle(fontSize: 36)),
          ),
          Text(message, textAlign: TextAlign.center, style: const TextStyle(fontSize: 18)),
          Container(
            margin: const EdgeInsets.only(top: 12),
            child:
                Text(errorMessage, textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).hintColor)),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (showBackButton)
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: ElevatedButton(
                  child: Text(L10n.of(context).back),
                  onPressed: () {
                    // Check if we can actually pop the last route, as we might have opened here directly from another app
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                      return;
                    }

                    // If we're running on Android, close the app gracefully. Otherwise, return to the home screen
                    if (Platform.isAndroid) {
                      SystemNavigator.pop();
                    } else {
                      Navigator.pushReplacementNamed(context, routeHome);
                    }
                  },
                ),
              ),
            if (onRetry != null) const SizedBox(width: 16),
            if (onRetry != null)
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: AsyncButtonBuilder(
                  showError: false,
                  showSuccess: false,
                  builder: (context, child, callback, buttonState) {
                    return ElevatedButton(
                      onPressed: callback,
                      child: child,
                    );
                  },
                  child: Text(retryText),
                  onPressed: () => onRetry(),
                ),
              )
          ])
        ],
      ),
    );
  }
}

class InlineErrorWidget extends FritterErrorWidget {
  final Object? error;

  const InlineErrorWidget({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: const Icon(Icons.error_rounded, color: Colors.red),
          ),
          Text('$error', textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).hintColor)),
        ],
      ),
    );
  }
}

class AlertErrorWidget extends FritterErrorWidget {
  final Object? error;
  final StackTrace? stackTrace;
  final String prefix;

  const AlertErrorWidget({Key? key, required this.error, required this.stackTrace, required this.prefix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: FullPageErrorWidget(error: error, prefix: prefix, stackTrace: stackTrace),
    );
  }
}

class ScaffoldErrorWidget extends FritterErrorWidget {
  final Object? error;
  final StackTrace? stackTrace;
  final String prefix;
  final Function? onRetry;
  final String? retryText;

  const ScaffoldErrorWidget(
      {Key? key, required this.error, required this.stackTrace, required this.prefix, this.onRetry, this.retryText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FullPageErrorWidget(
          error: error, prefix: prefix, stackTrace: stackTrace, onRetry: onRetry, retryText: retryText),
    );
  }
}

class FullPageErrorWidget extends FritterErrorWidget {
  final Object? error;
  final StackTrace? stackTrace;
  final String prefix;
  final Function? onRetry;
  final String? retryText;

  const FullPageErrorWidget(
      {Key? key, required this.error, required this.stackTrace, required this.prefix, this.onRetry, this.retryText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var onRetry = this.onRetry;

    var error = this.error;
    if (error is SocketException) {
      return EmojiErrorWidget(
        emoji: '🔌',
        message: L10n.of(context).could_not_contact_twitter,
        errorMessage: L10n.of(context).please_check_your_internet_connection_error_message(error.message),
        onRetry: onRetry,
      );
    }

    if (error is TwitterError) {
      return createEmojiError(error);
    }

    if (error is TimeoutException) {
      return EmojiErrorWidget(
        emoji: '⏱️',
        message: L10n.of(context).timed_out,
        errorMessage: L10n.of(context).this_took_too_long_to_load_please_check_your_network_connection,
        onRetry: onRetry,
      );
    }

    String errorStr;
    if (error is http.Response) {
      errorStr = error.body;
    }
    else if (error is Exception) {
      errorStr = error.toString();
    }
    else {
      errorStr = 'Error of type ${error.runtimeType.toString()}';
    }

    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: const Icon(Icons.error_rounded, color: Colors.red, size: 36),
            ),
            Text(
              L10n.of(context).oops_something_went_wrong,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12),
              child: Text(prefix, textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).hintColor)),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 12),
              child: Text(errorStr, textAlign: TextAlign.left, style: TextStyle(color: Theme.of(context).hintColor)),
            ),
            if (onRetry != null)
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: ElevatedButton(
                  child: Text(retryText ?? L10n.of(context).retry),
                  onPressed: () => onRetry(),
                ),
              )
          ],
        ),
      ),
    );
  }
}
