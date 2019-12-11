import 'package:bookvoed/mvp/base_presenter.dart';
import 'package:bookvoed/mvp/base_view.dart';
import 'package:bookvoed/network/user_api.dart';
import 'package:bookvoed/screens/user/user_view.dart';

class UserPresenter extends BasePresenter<UserView> {

  UserApi _userApi;

  UserPresenter(BaseView view, this._userApi) : super(view);

}