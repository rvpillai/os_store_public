import 'package:http/http.dart' as http;
import 'package:os_store/network/url.dart';

class Request {
  final String url;
  final dynamic body;

  Request({required this.url, this.body});

  Future<http.Response> get() {
    return http.get(Uri.parse(urlBase + url)).timeout(const Duration(minutes: 2));
  }
}
