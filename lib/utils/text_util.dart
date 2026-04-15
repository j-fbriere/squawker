import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:linkify/linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class TextUtil {

  static int countChar(String str, int start, int end, String char) {
    int count = 0;
    for (int i = start; i < end; i++) {
      if (str[i] == char) {
        count++;
      }
    }
    return count;
  }

  static String initials(String name) {
    int idx = name.indexOf(',');
    if (idx > 0) {
      name = name.substring(0, idx);
    }
    List<String> lst = name.split(RegExp(r'[ -]'));
    return lst.map((s) => s[0]).join();
  }

  static String shortInitials(String name) {
    int idx = name.indexOf(',');
    if (idx > 0) {
      name = name.substring(0, idx);
    }
    List<String> lst = name.split(RegExp(r' '));
    return '${lst.first[0]}${lst.last[0]}';
  }

  static String firstUppercase(String text) {
    return '${text[0].toUpperCase()}${text.substring(1)}';
  }

  static String maybePlural(String word, int nbr) {
    return nbr > 1 ? '${word}s' : word;
  }

  static String replaceAllDoubleBracesProps(String text, Map<String, String> props) {
    for (String k in props.keys) {
      text = text.replaceAll('{{${k}}}', props[k]!);
    }
    return text;
  }

  static Future<void> _launch(String url) async {
    await launchUrl(Uri.parse(url),
      mode: LaunchMode.platformDefault);
  }

  static List<InlineSpan> textWithLinks(String text, {TextStyle? textStyle, TextStyle? linkStyle}) {
    List<LinkifyElement> leLst = linkify(text);
    List<TextSpan> tsLst = leLst.map((le) {
      if (le is LinkableElement) {
        return TextSpan(
          text: le.text,
          style: linkStyle,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              _launch(le.url);
            }
        );
      }
      else { // le is TextElement
        return TextSpan(
          text: le.text,
          style: textStyle,
        );
      }
    }).toList();
    return tsLst;
  }

  static String textToUtf8Hexa(String text) {
    List<int> utf8Bytes = utf8.encoder.convert(text);
    return utf8Bytes.map((u) => u.toRadixString(16)).join(' ');
  }

}
