import 'package:bookvoed/entity/Jwt.dart';

abstract class UserApi {

  Future<Jwt> login(String username, String password);

  Future<Jwt> registration(String username, String password);
}