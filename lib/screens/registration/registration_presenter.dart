import 'package:bookvoed/network/user_api.dart';
import 'package:bookvoed/mvp/base_presenter.dart';
import 'package:bookvoed/utils/user_property_validator.dart';
import 'package:bookvoed/screens/registration/registration_view.dart';

import '../../utils/preferences.dart';

class RegistrationPresenter extends BasePresenter<RegistrationView> {

  UserApi _api;

  RegistrationPresenter(RegistrationView view, this._api) : super(view);

  void registration(String username, String password,
      String passwordConfirmation) {
    if (_validateUserProperties(username, password, passwordConfirmation)) {
      view.showProgressDialog(true);
      _api.registration(username, password).then((jwt) {
        Preferences.setUsername(username);
        Preferences.setPassword(password);
        view.showProgressDialog(false);
        view.onUserRegistered();
      }).catchError((error) {
        view.showProgressDialog(false);
        view.showErrorDialog(error.toString());
      });
    }
  }

  bool _validateUserProperties(String username, String password,
      String passwordConfirmation) {
    if (!UserPropertyValidator.validateUsername(username)) {
      view.showErrorDialog("Username isn't correct");
      return false;
    }
    if(!UserPropertyValidator.validatePassword(password)) {
      view.showErrorDialog("Username is empty");
      return false;
    }
    if(password != passwordConfirmation) {
      view.showErrorDialog("Password and confirmation aren't equal");
      return false;
    }
    return true;
  }
}