class User {

  String userName;
  String firstName;
  String secondName;
  List<String> myBooks = List();
  String avatar;

  User(this.userName, this.firstName, this.secondName);

  User.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    firstName = json['firstName'];
    secondName = json['secondName'];
    myBooks = List<String>.from(json['myBooks']);
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['userName'] = userName;
    json['firstName'] = firstName;
    json['secondName'] = secondName;
    json['avatar'] = avatar;
    return json;
  }
}
