import 'package:bookvoed/app_values.dart';
import 'package:bookvoed/mvp/base_presenter.dart';
import 'package:bookvoed/screens/main/main_view.dart';
import 'package:bookvoed/utils/preferences.dart';
import 'package:bookvoed/utils/text_utils.dart';

class MainPresenter extends BasePresenter<MainView> {
  MainPresenter(MainView view) : super(view);

  void logout() {
    Preferences.clearUserCredentials();
    view.openLoginScreen();
  }

  void onUserClicked() {
    view.openUserScreen();
  }

  String getUserFirstSecondName() {
    var user = AppValues.get().user;
    if(isStringNotEmpty(user.firstName))
      return "${user.firstName} ${user.secondName}";
    else return user.userName;
  }
}