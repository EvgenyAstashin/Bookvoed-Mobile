import 'dart:io';

import 'package:bookvoed/mvp/base_view.dart';

abstract class UserView extends BaseView {

  void showProgress(bool show);

  void showErrorMessage(String message);

  String getFirstName();

  String getSecondName();

  void goNext();

  void setFirstName(String firstName);

  void setSecondName(String secondName);

  void setAvatarFromFile(File avatar);

  void setAvatarFromNetwork(String link);
}