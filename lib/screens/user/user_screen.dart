import 'package:bookvoed/dialogs/error_dialog.dart';
import 'package:bookvoed/dialogs/progress_dialog.dart';
import 'package:bookvoed/network/user_api_impl.dart';
import 'package:bookvoed/screens/user/user_presenter.dart';
import 'package:bookvoed/screens/user/user_view.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  final nextScreen;

  UserScreen(this.nextScreen);

  @override
  State<StatefulWidget> createState() {
    return UserState();
  }
}

class UserState extends State<UserScreen> implements UserView {
  UserPresenter _presenter;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _secondNameController = TextEditingController();
  ProgressDialog _progressDialog;

  @override
  void initState() {
    super.initState();
    _presenter = UserPresenter(this, UserApiImpl());
    _progressDialog = ProgressDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new AssetImage(
                                'assets/images/no_avatar.jpg')))),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                    maxLines: 1,
                    controller: _firstNameController,
                    decoration: InputDecoration(labelText: 'First name')),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                    maxLines: 1,
                    controller: _secondNameController,
                    decoration: InputDecoration(labelText: 'Second name')),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    child: Text("Done"),
                    color: Colors.green,
                    onPressed: () {
                      _presenter.sendUserData();
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void showProgress(bool show) {
    _progressDialog.show(show);
  }

  @override
  void showErrorMessage(String message) {
    ErrorDialog.show(context, message);
  }

  @override
  String getFirstName() {
    return _firstNameController.text;
  }

  @override
  String getSecondName() {
    return _secondNameController.text;
  }

  @override
  void goNext() {
    Navigator.pop(context);
    if (widget.nextScreen != null)
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => widget.nextScreen));
  }

  @override
  void setFirstName(String firstName) {
    _firstNameController.text = firstName;
  }

  @override
  void setSecondName(String secondName) {
    _secondNameController.text = secondName;
  }
}
