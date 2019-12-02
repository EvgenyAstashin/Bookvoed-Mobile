import 'dart:convert';

import 'package:bookvoed/app_values.dart';
import 'package:bookvoed/entity/Jwt.dart';
import 'package:bookvoed/network/requests/login_request.dart';
import 'package:bookvoed/network/user_api.dart';
import 'package:http/http.dart' as http;

class UserApiImpl extends UserApi {

  @override
  Future<Jwt> login(String username, String password) async {

    var uri = Uri.http(AppValues.baseUrl, '/users/login');
    var request = LoginRequest(username, password);
    Map<String, String> headers = Map();
    headers['Content-Type'] = 'application/json';
    var body = json.encode(request);
    var response = await http.post(uri, headers:headers, body: body);
    if (response.statusCode == 200)
      return Jwt.fromJson(json.decode(response.body));
    else
      throw Exception('Not Autorized');


  }

  @override
  Future<Jwt> registration(String username, String password) {
    // TODO: implement registration
    return null;
  }
}