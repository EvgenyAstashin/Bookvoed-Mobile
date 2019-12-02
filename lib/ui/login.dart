import 'package:bookvoed/network/user_api_impl.dart';
import 'package:bookvoed/presenter/login_presenter.dart';
import 'package:bookvoed/view/login_view.dart';
import 'package:flutter/material.dart';

import '../home.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginScreen> implements LoginView {
  
  LoginPresenter _presenter;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  
  LoginState() {
    _presenter = LoginPresenter(this, UserApiImpl());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Padding(
          padding: EdgeInsets.only(top: 100.0, left: 10.0, right: 10.0),
          child: Column(
            children: <Widget>[
              Image.asset('assets/images/logo.png', width: MediaQuery.of(context).size.width * 0.65),
              TextField(
                maxLines: 1,
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username')
              ),
              TextField(
                maxLines: 1,
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true
              ),
              RaisedButton(
                child: Text("Sign in"),
                onPressed:() {_presenter.login(_usernameController.text, _passwordController.text);},
              ),
              Text("Create account")
            ],
          ),
        ));
  }

  @override
  void onUserSignedIn() {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  void showIncorrectUsernameOrPasswordError() {

  }
}
