import 'entity/user.dart';

class AppValues {

  static AppValues _instance;

  AppValues._();

  static AppValues get() {
    if(_instance == null)
      _instance = AppValues._();
    return _instance;
  }

  static String baseUrl = '10.69.252.153:8080';
  //static String baseUrl = '192.168.100.3:8080';
  User user;
  String token;
}