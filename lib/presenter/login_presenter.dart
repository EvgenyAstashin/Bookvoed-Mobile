import 'package:bookvoed/app_values.dart';
import 'package:bookvoed/network/user_api.dart';
import 'package:bookvoed/presenter/base_presenter.dart';
import 'package:bookvoed/view/login_view.dart';

class LoginPresenter extends BasePresenter<LoginView> {

  UserApi userApi;

  LoginPresenter(LoginView view, this.userApi) : super(view);

  void login(String username, String password) {
    userApi.login(username, password)
        .then((jwt) {
          AppValues.get().token = jwt.token;
          view.onUserSignedIn();
    })
        .catchError((error) {
          view.showIncorrectUsernameOrPasswordError();
        });
  }
  
}