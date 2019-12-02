class Jwt {

  String token;
  String type;

  Jwt(this.token, this.type);

  Jwt.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    type = json['type'];
  }
}