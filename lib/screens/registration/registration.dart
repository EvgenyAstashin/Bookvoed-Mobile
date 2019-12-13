import 'package:bookvoed/dialogs/error_dialog.dart';
import 'package:bookvoed/dialogs/progress_dialog.dart';
import 'package:bookvoed/network/user_api_impl.dart';
import 'package:bookvoed/screens/registration/registration_presenter.dart';
import 'package:bookvoed/screens/registration/registration_view.dart';
import 'package:bookvoed/screens/user/user_screen.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegistrationState();
  }
}

class RegistrationState extends State<RegistrationScreen> implements RegistrationView {

  RegistrationPresenter _presenter;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmationController = TextEditingController();
  ProgressDialog _progressDialog;

  RegistrationState() {
    _presenter = RegistrationPresenter(this, UserApiImpl());
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
                    obscureText: true),
                TextField(
                    maxLines: 1,
                    controller: _passwordConfirmationController,
                    decoration: InputDecoration(labelText: 'Password confirmation'),
                    obscureText: true)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.02, bottom: height * 0.02),
            child: RaisedButton(
              child: Text("Registration"),
              color: Colors.green,
              onPressed: () {
                _presenter.registration(
                    _usernameController.text, _passwordController.text, _passwordConfirmationController.text);
              },
            ),
          )
        ]));
  }

  @override
  void showErrorDialog(String message) {
    ErrorDialog.show(context, message);
  }

  @override
  void showProgressDialog(bool show) {
    _progressDialog.show(show);
  }

  @override
  void onUserRegistered() {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserScreen()),
    );
  }

}
