import 'dart:convert';
import 'package:http/http.dart' as http;

import '../app_values.dart';

class HttpClient {

  static Future<T> get<T>(String url) {
    return null;
  }

  static Future<http.Response> post(String url, Map<String, dynamic> body) async {
    var uri = Uri.http(AppValues.baseUrl, url);
    Map<String, String> headers = Map();
    headers['Content-Type'] = 'application/json';
    return await http.post(uri, headers:headers, body: json.encode(body));
  }
}