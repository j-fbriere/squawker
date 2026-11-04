import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:html/dom.dart' as html_dom;
import 'package:html/parser.dart' as html_parser;
import 'package:http/http.dart' as http;
import 'package:squawker/exceptions.dart';

import 'client_transaction_id_exception.dart';
import 'constants.dart';
import 'cubic_curve.dart';
import 'interpolate.dart';
import 'rotation.dart';
import 'utils.dart';

const _browserHeaders = {
  'Accept-Language': 'en-US,en;q=0.9',
  'Cache-Control': 'no-cache',
  'Referer': 'https://x.com',
  'User-Agent':
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36',
  'X-Twitter-Active-User': 'yes',
  'X-Twitter-Client-Language': 'en',
};

typedef TextFetcher = Future<String> Function(Uri uri);

class ClientTransaction {
  final List<int> _keyBytes;
  final String _animationKey;
  final String _randomKeyword;
  final int _randomNumber;

  ClientTransaction._({
    required this._keyBytes,
    required this._animationKey,
    required this._randomKeyword,
    required this._randomNumber,
  });

  /// Fetches x.com and initializes the transaction ID generator.
  static Future<ClientTransaction> initialize({
    String randomKeyword = defaultKeyword,
    int randomNumber = additionalRandomNumber,
  }) async {
    final (:homePageHtml, :signFileText) = await fetchSources();
    return fromSources(
      homePageHtml: homePageHtml,
      signFileText: signFileText,
      randomKeyword: randomKeyword,
      randomNumber: randomNumber,
    );
  }

  /// Downloads the x.com page and the sign module the generator is built from.
  /// [fetch] lets the tests replay recorded files instead of using the network.
  static Future<({String homePageHtml, String signFileText})> fetchSources({TextFetcher fetch = _fetchText}) async {
    final homePageHtml = await fetch(Uri.https('x.com', '/home'));
    final signFileText = await fetch(await _findSignFileUrl(homePageHtml, fetch));
    return (homePageHtml: homePageHtml, signFileText: signFileText);
  }

  /// Builds the generator from an already fetched x.com page and sign module.
  static ClientTransaction fromSources({
    required String homePageHtml,
    required String signFileText,
    String randomKeyword = defaultKeyword,
    int randomNumber = additionalRandomNumber,
  }) {
    try {
      final homePageDoc = html_parser.parse(homePageHtml);
      final (rowIndex, keyBytesIndices) = _getIndices(signFileText);
      final keyBytes = _getKeyBytes(_getKey(homePageDoc));
      final animationKey = _computeAnimationKey(
        keyBytes: keyBytes,
        rowIndex: rowIndex,
        keyBytesIndices: keyBytesIndices,
        homePageDoc: homePageDoc,
      );

      return ClientTransaction._(
        keyBytes: keyBytes,
        animationKey: animationKey,
        randomKeyword: randomKeyword,
        randomNumber: randomNumber,
      );
    } on ClientTransactionIdException {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        ClientTransactionIdException("Couldn't read the page and the sign module: $error"),
        stackTrace,
      );
    }
  }

  /// Generates the x-client-transaction-id for the given HTTP method and path.
  String generateTransactionId(String method, String path, {DateTime? now}) {
    final timeNow =
        ((now ?? DateTime.now()).millisecondsSinceEpoch - 1682924400 * 1000) ~/ 1000;
    final timeNowBytes = List.generate(4, (i) => (timeNow >> (i * 8)) & 0xFF);

    final hashInput = '$method!$path!$timeNow$_randomKeyword$_animationKey';
    final hashBytes = sha256.convert(utf8.encode(hashInput)).bytes;

    final randomNum = Random().nextInt(256);
    final bytesArr = [
      ..._keyBytes,
      ...timeNowBytes,
      ...hashBytes.take(16),
      _randomNumber,
    ];
    final out = Uint8List(bytesArr.length + 1);
    out[0] = randomNum;
    for (int i = 0; i < bytesArr.length; i++) {
      out[i + 1] = bytesArr[i] ^ randomNum;
    }

    return base64.encode(out).replaceAll('=', '');
  }

  // --- Private helpers (static, mirroring Python class methods) ---

  static (int, List<int>) _getIndices(String signFileText) {
    final indices = indicesRegex
        .allMatches(signFileText)
        .map((m) => int.parse(m.group(2)!))
        .toList();
    if (indices.isEmpty) throw const ClientTransactionIdException("Couldn't get KEY_BYTE indices");
    return (indices[0], indices.sublist(1));
  }

  static String _getKey(html_dom.Document doc) {
    final element =
        doc.querySelector("meta[name='twitter-site-verification']");
    if (element == null) {
      throw const ClientTransactionIdException(
          "Couldn't get [twitter-site-verification] key from the page source");
    }
    return element.attributes['content']!;
  }

  static List<int> _getKeyBytes(String key) => base64.decode(key).toList();

  /// An error page (e.g. a 503) is not a change in how X signs requests, so it
  /// must not end up as a [ClientTransactionIdException].
  static Future<String> _fetchText(Uri uri) async {
    final response = await http.get(uri, headers: _browserHeaders);
    if (response.statusCode < 200 || response.statusCode >= 300) throw HttpException(response);
    return response.body;
  }

  static Future<Uri> _findSignFileUrl(String homePageHtml, TextFetcher fetch) async {
    final entryUrl = _resolveImport(Uri.https('x.com', '/'), homePageHtml, entryScriptRegex, 'entry script');
    final entryText = await fetch(entryUrl);
    final imports = staticImportRegex.allMatches(entryText).map((match) => entryUrl.resolve(match.group(1)!));
    return _findSignFileImportedBy(imports, fetch);
  }

  /// X names its modules by a hash only, so the module importing the sign
  /// module is the first one, among those of the entry script, that does.
  static Future<Uri> _findSignFileImportedBy(Iterable<Uri> modules, TextFetcher fetch) async {
    for (final module in modules) {
      final match = signFileRegex.firstMatch(await fetch(module));
      if (match != null) return module.resolve(match.group(1)!);
    }
    throw const ClientTransactionIdException("Couldn't find the sign module");
  }

  static Uri _resolveImport(Uri base, String text, RegExp regex, String what) {
    final match = regex.firstMatch(text);
    if (match == null) throw ClientTransactionIdException("Couldn't find the $what");
    return base.resolve(match.group(1)!);
  }

  static List<List<int>> _get2dArray(
      List<int> keyBytes, html_dom.Document doc) {
    final frames = doc.querySelectorAll('[id^="loading-x-anim"]');
    final frame = frames[keyBytes[5] % 4];
    final pathElement = frame.children[0].children[1];
    final d = pathElement.attributes['d']!.substring(9);
    return d
        .split('C')
        .map((segment) {
          final cleaned = segment.replaceAll(RegExp(r'[^\d]+'), ' ').trim();
          if (cleaned.isEmpty) return <int>[];
          return cleaned
              .split(RegExp(r'\s+'))
              .where((s) => s.isNotEmpty)
              .map(int.parse)
              .toList();
        })
        .where((row) => row.isNotEmpty)
        .toList();
  }

  static double _solve(
      double value, double minVal, double maxVal, bool rounding) {
    final result = value * (maxVal - minVal) / 255.0 + minVal;
    return rounding ? result.floor().toDouble() : roundTo2(result);
  }

  static String _animate(List<int> frames, double targetTime) {
    final fromColor = [
      frames[0].toDouble(), frames[1].toDouble(),
      frames[2].toDouble(), 1.0,
    ];
    final toColor = [
      frames[3].toDouble(), frames[4].toDouble(),
      frames[5].toDouble(), 1.0,
    ];
    final fromRotation = [0.0];
    final toRotation = [_solve(frames[6].toDouble(), 60.0, 360.0, true)];

    final framesTail = frames.sublist(7);
    final curves = framesTail
        .asMap()
        .entries
        .map((e) => _solve(e.value.toDouble(), isOdd(e.key), 1.0, false))
        .toList();

    final cubic = Cubic(curves);
    final val = cubic.getValue(targetTime);

    var color = interpolate(fromColor, toColor, val);
    color = color.map((v) => v.clamp(0.0, 255.0)).toList();

    final rotation = interpolate(fromRotation, toRotation, val);
    final matrix = convertRotationToMatrix(rotation[0]);

    final strArr = <String>[];
    for (int i = 0; i < color.length - 1; i++) {
      strArr.add(color[i].round().toRadixString(16));
    }
    for (final value in matrix) {
      double rounded = roundTo2(value);
      if (rounded < 0) rounded = -rounded;
      final hexValue = floatToHex(rounded);
      if (hexValue.startsWith('.')) {
        strArr.add('0$hexValue'.toLowerCase());
      } else if (hexValue.isNotEmpty) {
        strArr.add(hexValue);
      } else {
        strArr.add('0');
      }
    }
    strArr.addAll(['0', '0']);

    return strArr.join().replaceAll(RegExp(r'[.\-]'), '');
  }

  static String _computeAnimationKey({
    required List<int> keyBytes,
    required int rowIndex,
    required List<int> keyBytesIndices,
    required html_dom.Document homePageDoc,
  }) {
    const totalTime = 4096;
    final frameRowIndex = keyBytes[rowIndex] % 16;
    final frameTimeProduct = keyBytesIndices
        .fold<int>(1, (acc, idx) => acc * (keyBytes[idx] % 16));
    final frameTime = jsRound(frameTimeProduct / 10.0) * 10;

    final arr = _get2dArray(keyBytes, homePageDoc);
    final frameRow = arr[frameRowIndex];
    final targetTime = frameTime / totalTime;
    return _animate(frameRow, targetTime.toDouble());
  }
}
