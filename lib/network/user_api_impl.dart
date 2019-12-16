import 'dart:convert';

import 'package:bookvoed/app_values.dart';
import 'package:bookvoed/entity/user.dart';
import 'package:bookvoed/network/http_client.dart';
import 'package:bookvoed/network/requests/login_registration_request.dart';
import 'package:bookvoed/network/responses/login_registration_response.dart';
import 'package:bookvoed/network/user_api.dart';

class UserApiImpl extends UserApi {

  @override
  Future<LoginRegistrationResponse> login(String username, String password) async {
    var request = LoginRegistrationRequest(username, password);
    var response = await HttpClient.post('/users/login', request.toJson());
    if (response.statusCode == 200)
      return deserializeLRResponseAndSaveUserAndToken(response.body);
    else
      throw Exception('Not Autorized');
  }

  @override
  Future<LoginRegistrationResponse> registration(String username, String password) async {
    var request = LoginRegistrationRequest(username, password);
    var response = await HttpClient.post('/users/registration', request.toJson());
    if (response.statusCode == 201)
      return deserializeLRResponseAndSaveUserAndToken(response.body);
    else
      throw Exception("Username isn't available");
  }

  @override
  Future<User> getUser() async {
    var response = await HttpClient.get('/users');
    if (response.statusCode == 200)
      return User.fromJson(json.decode(response.body));
    else
      throw Exception();
  }

  @override
  Future<User> updateUser(User user) async {
    var response = await HttpClient.patch('/users', user.toJson());
    if (response.statusCode == 200)
      return User.fromJson(json.decode(response.body));
    else
      throw Exception();
  }

  LoginRegistrationResponse deserializeLRResponseAndSaveUserAndToken(String body) {
    var response = LoginRegistrationResponse.fromJson(json.decode(body));
    AppValues.get().token = response.jwt.token;
    AppValues.get().user = response.user;
    return response;
  }
}