import 'dart:convert';

import 'package:bookvoed/entity/Jwt.dart';
import 'package:bookvoed/network/http_client.dart';
import 'package:bookvoed/network/requests/login_request.dart';
import 'package:bookvoed/network/user_api.dart';

class UserApiImpl extends UserApi {

  @override
  Future<Jwt> login(String username, String password) async {
    var request = LoginRegistrationRequest(username, password);
    var response = await HttpClient.post('/users/login', request.toJson());
    if (response.statusCode == 200)
      return Jwt.fromJson(json.decode(response.body));
    else
      throw Exception('Not Autorized');
  }

  @override
  Future<Jwt> registration(String username, String password) async {
    var request = LoginRegistrationRequest(username, password);
    var response = await HttpClient.post('/users/registration', request.toJson());
    if (response.statusCode == 201)
      return Jwt.fromJson(json.decode(response.body));
    else
      throw Exception("Username isn't available");
  }
}