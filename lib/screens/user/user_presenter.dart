import 'package:bookvoed/app_values.dart';
import 'package:bookvoed/entity/user.dart';
import 'package:bookvoed/mvp/base_presenter.dart';
import 'package:bookvoed/mvp/base_view.dart';
import 'package:bookvoed/network/user_api.dart';
import 'package:bookvoed/screens/user/user_view.dart';

class UserPresenter extends BasePresenter<UserView> {

  UserApi _userApi;

  UserPresenter(BaseView view, this._userApi) : super(view) {
    _setUserData();
  }

  void sendUserData() {
    view.showProgress(true);
    var builtUser = _buildUser();
    _userApi.updateUser(builtUser).then((user) {
      AppValues.get().user = user;
      view.showProgress(false);
      view.goNext();
    }).catchError((error) {
      view.showProgress(false);
      view.showErrorMessage(error.toString());
    });
  }

  void _setUserData() {
    var user = AppValues.get().user;
    view.setFirstName(user.firstName);
    view.setSecondName(user.secondName);
  }

  User _buildUser() {
    var savedUser = AppValues.get().user;
    return User(savedUser.userName, view.getFirstName(), view.getSecondName());
  }
}
