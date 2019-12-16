import 'dart:convert';
import 'package:bookvoed/utils/text_utils.dart';
import 'package:http/http.dart' as http;

import '../app_values.dart';

class HttpClient {

  static Future<http.Response> get(String url) async {
    var uri = Uri.http(AppValues.baseUrl, url);
    Map<String, String> headers = Map();
    _setAuthHeader(headers);
    return await http.get(uri, headers: headers);
  }

  static Future<http.Response> post(String url, Map<String, dynamic> body) async {
    var uri = Uri.http(AppValues.baseUrl, url);
    Map<String, String> headers = Map();
    headers['Content-Type'] = 'application/json';
    _setAuthHeader(headers);
    return await http.post(uri, headers:headers, body: json.encode(body));
  }

  static Future<http.Response> patch(String url, Map<String, dynamic> body) async {
    var uri = Uri.http(AppValues.baseUrl, url);
    Map<String, String> headers = Map();
    headers['Content-Type'] = 'application/json';
    _setAuthHeader(headers);
    return await http.patch(uri, headers:headers, body: json.encode(body));
  }

  static void _setAuthHeader( Map<String, String> headers) {
    var token = AppValues.get().token;
    if(isStringNotEmpty(token))
      headers['Authorization'] = 'Bearer $token';
  }
}