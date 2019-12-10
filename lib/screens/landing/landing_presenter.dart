import 'package:bookvoed/mvp/base_presenter.dart';
import 'package:bookvoed/network/user_api.dart';
import 'package:bookvoed/preferences.dart';
import 'package:bookvoed/screens/landing/landing_view.dart';

import '../../thread_utils.dart';

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
      _api.login(pair.first, pair.second).then((jwt) {
        view.openMainScreen();
      }).catchError(() {
        view.openLoginScreen();
      });
    });
  }
}