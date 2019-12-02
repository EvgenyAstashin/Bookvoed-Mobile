import 'base_view.dart';

abstract class LoginView extends BaseView {

  void showIncorrectUsernameOrPasswordError();

  void onUserSignedIn();

  void showProgressDialog(bool show);
}