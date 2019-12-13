import 'package:bookvoed/entity/Jwt.dart';
import 'package:bookvoed/entity/user.dart';

class LoginRegistrationResponse {

  User user;
  Jwt jwt;

  LoginRegistrationResponse(this.user, this.jwt);

  LoginRegistrationResponse.fromJson(Map<String, dynamic> json) {
    user = User.fromJson(json[user]);
    jwt = Jwt.fromJson(json[jwt]);
  }
}