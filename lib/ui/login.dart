import 'package:bookvoed/network/user_api_impl.dart';
import 'package:bookvoed/presenter/login_presenter.dart';
import 'package:bookvoed/ui/dialogs/error_dialog.dart';
import 'package:bookvoed/ui/registration.dart';
import 'package:bookvoed/view/login_view.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'dialogs/progress_dialog.dart';

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
  ProgressDialog _progressDialog;

  LoginState() {
    _presenter = LoginPresenter(this, UserApiImpl());
  }

  @override
  void initState() {
    super.initState();
    _progressDialog = ProgressDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: height * 0.15, left: width * 0.15, right: width * 0.15),
            child: Image.asset('assets/images/logo.png'),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: height * 0.1, left: width * 0.05, right: width * 0.05),
            child: Column(
              children: <Widget>[
                TextField(
                    maxLines: 1,
                    controller: _usernameController,
                    decoration: InputDecoration(labelText: 'Username')),
                TextField(
                    maxLines: 1,
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.02, bottom: height * 0.02),
            child: RaisedButton(
              child: Text("Sign in"),
              color: Colors.green,
              onPressed: () {
                _presenter.login(
                    _usernameController.text, _passwordController.text);
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              _openRegistrationScreen();
            },
            child: Text("Create account",
                style: TextStyle(fontWeight: FontWeight.bold)),
          )
        ]));
  }

  @override
  void onUserSignedIn() {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
    );
  }

  @override
  void showIncorrectUsernameOrPasswordError() {
    ErrorDialog.show(context, "Username or password isn't correct");
  }

  @override
  void showProgressDialog(bool show) {
    _progressDialog.show(show);
  }

  void _openRegistrationScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegistrationScreen()),
    );
  }
}
