import 'package:bookvoed/network/user_api.dart';
import 'package:bookvoed/mvp/base_presenter.dart';
import 'package:bookvoed/utils/preferences.dart';
import 'package:bookvoed/screens/login/login_view.dart';

class LoginPresenter extends BasePresenter<LoginView> {

  UserApi userApi;

  LoginPresenter(LoginView view, this.userApi) : super(view);

  void login(String username, String password) {
    view.showProgress(true);
    userApi.login(username, password).then((response) {
      Preferences.setUsername(username);
      Preferences.setPassword(password);
      view.showProgress(false);
      view.onUserSignedIn();
    }).catchError((error) {
      view.showProgress(false);
      view.showIncorrectUsernameOrPasswordError();
    });
  }
}