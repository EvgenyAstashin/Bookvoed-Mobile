import 'package:bookvoed/app_values.dart';
import 'package:bookvoed/network/user_api.dart';
import 'package:bookvoed/mvp/base_presenter.dart';
import 'package:bookvoed/screens/login/login_view.dart';

class LoginPresenter extends BasePresenter<LoginView> {

  UserApi userApi;

  LoginPresenter(LoginView view, this.userApi) : super(view);

  void login(String username, String password) {
    view.showProgressDialog(true);
    userApi.login(username, password).then((jwt) {
      AppValues.get().token = jwt.token;
      view.showProgressDialog(false);
      view.onUserSignedIn();
    }).catchError((error) {
      view.showProgressDialog(false);
      view.showIncorrectUsernameOrPasswordError();
    });
  }
}