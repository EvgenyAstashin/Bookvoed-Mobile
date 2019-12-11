import 'package:bookvoed/network/user_api_impl.dart';
import 'package:bookvoed/screens/user/user_presenter.dart';
import 'package:bookvoed/screens/user/user_view.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return UserState();
  }
}

class UserState extends State<UserScreen> implements UserView {

  UserPresenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = UserPresenter(this, UserApiImpl());
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }

}