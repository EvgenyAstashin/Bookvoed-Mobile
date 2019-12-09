import 'package:shared_preferences/shared_preferences.dart';

class Preferences {

  static const String _USERNAME = 'password';
  static const String _PASSWORD = 'password';

  static setUsername(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_USERNAME, username);
  }

  static Future<String> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_USERNAME);
  }

  static setPassword(String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_PASSWORD, password);
  }

  static Future<String> getPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PASSWORD);
  }
}