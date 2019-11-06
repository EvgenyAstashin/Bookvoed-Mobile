import 'package:bookvoed/presenter/login_presenter.dart';
import 'package:bookvoed/view/login_view.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginScreen> implements LoginView {

  LoginPresenter presenter;

  LoginState() {
    presenter = LoginPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}