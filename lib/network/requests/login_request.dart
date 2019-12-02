class LoginRequest {
  String username;
  String passphrase;

  LoginRequest(this.username, this.passphrase);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = username;
    data['passphrase'] = passphrase;
    return data;
  }
}