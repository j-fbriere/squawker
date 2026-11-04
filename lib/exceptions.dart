import 'package:http/http.dart';

class HttpException {
  final Response response;

  HttpException(this.response);

  int get statusCode => response.statusCode;
  String? get reasonPhrase => response.reasonPhrase;
  String get body => response.body;
  String? get uri => response.request?.url.toString();

  @override
  String toString() {
    return 'HttpException{statusCode: $statusCode, reasonPhrase: $reasonPhrase, uri: $uri, body: $body';
  }
}
