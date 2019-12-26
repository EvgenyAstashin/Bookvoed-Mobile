import 'package:bookvoed/mvp/base_presenter.dart';
import 'package:bookvoed/network/user/user_api.dart';
import 'package:bookvoed/utils/preferences.dart';
import 'package:bookvoed/screens/landing/landing_view.dart';
import 'package:bookvoed/utils/thread_utils.dart';

class LandingPresenter extends BasePresenter<LandingView> {

  UserApi _api;

  LandingPresenter(LandingView view, this._api) : super(view) {
    Preferences.isUserCredentialsPresented().then((isPresented) {
      if(isPresented)
        _login();
      else
        view.openLoginScreen();
    });
  }

  void _login() {
    concatenateFutures<String, String>(Preferences.getUsername(), Preferences.getPassword()).then((pair) {
      _api.login(pair.first, pair.second).then((response) {
        view.openMainScreen();
      }).catchError((error) {
        view.openLoginScreen();
      });
    });
  }
}