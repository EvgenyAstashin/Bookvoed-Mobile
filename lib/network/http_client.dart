import 'dart:convert';
import 'package:http/http.dart' as http;

import '../app_values.dart';

class HttpClient {

  static Future<http.Response> get(String url) async {
    var uri = Uri.http(AppValues.baseUrl, url);
    Map<String, String> headers = Map();
    headers['Authorization'] = 'Bearer ' + AppValues.get().token;
    return await http.get(uri, headers: headers);
  }

  static Future<http.Response> post(String url, Map<String, dynamic> body) async {
    var uri = Uri.http(AppValues.baseUrl, url);
    Map<String, String> headers = Map();
    headers['Content-Type'] = 'application/json';
    headers['Authorization'] = 'Bearer ' + AppValues.get().token;
    return await http.post(uri, headers:headers, body: json.encode(body));
  }

  static Future<http.Response> patch(String url, Map<String, dynamic> body) async {
    var uri = Uri.http(AppValues.baseUrl, url);
    Map<String, String> headers = Map();
    headers['Content-Type'] = 'application/json';
    headers['Authorization'] = 'Bearer ' + AppValues.get().token;
    return await http.patch(uri, headers:headers, body: json.encode(body));
  }
}