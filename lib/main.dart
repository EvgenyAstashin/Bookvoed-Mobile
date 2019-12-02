import 'package:bookvoed/app_values.dart';
import 'package:bookvoed/ui/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  static AppValues appValues = AppValues.get();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookvoed',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColorDark: Colors.green.shade900
      ),
      home: LoginScreen(),
    );
  }
}
