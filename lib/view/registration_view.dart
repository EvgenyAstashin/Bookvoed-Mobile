import 'base_view.dart';

abstract class RegistrationView extends BaseView {

  void showErrorDialog(String message);

  void showProgressDialog(bool show);

  void onUserRegistered();
}