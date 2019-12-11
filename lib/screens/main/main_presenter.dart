import 'package:bookvoed/mvp/base_presenter.dart';
import 'package:bookvoed/screens/main/main_view.dart';
import 'package:bookvoed/utils/preferences.dart';

class MainPresenter extends BasePresenter<MainView> {
  MainPresenter(MainView view) : super(view);

  void logout() {
    Preferences.clearUserCredentials();
    view.openLoginScreen();
  }
}