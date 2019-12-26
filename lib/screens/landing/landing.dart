import 'package:bookvoed/network/user/user_api_impl.dart';
import 'package:bookvoed/screens/main/main.dart';
import 'package:bookvoed/screens/landing/landing_presenter.dart';
import 'package:bookvoed/screens/landing/landing_view.dart';
import 'package:bookvoed/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LandingState();
  }
}

class LandingState extends State<LandingScreen> implements LandingView {
  LandingPresenter _presenter;

  @override
  void initState() {
    _presenter = LandingPresenter(this, UserApiImpl());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(left: width * 0.15, right: width * 0.15),
            child: Image.asset('assets/images/logo.png'),
          ),
        ));
  }

  @override
  void openLoginScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  void openMainScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
    );
  }
}
