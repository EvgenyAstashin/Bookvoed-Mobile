import 'dart:io';

import 'package:bookvoed/entity/user.dart';
import 'package:bookvoed/network/responses/AvatartUploadingResponse.dart';
import 'package:bookvoed/network/responses/login_registration_response.dart';

abstract class UserApi {

  Future<LoginRegistrationResponse> login(String username, String password);

  Future<LoginRegistrationResponse> registration(String username, String password);

  Future<User> getUser();

  Future<User> updateUser(User user);

  Future<AvatarUploadingResponse> uploadAvatar(File file);
}