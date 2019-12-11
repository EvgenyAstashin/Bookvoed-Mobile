class UserPropertyValidator {

  static bool validateUsername(String username) {
    return username != null && username.length > 0;
  }

  static bool validatePassword(String password) {
    return password != null && password.length > 0;
  }
}