class User {

  String userName;
  String firstName;
  String secondName;
  List<String> myBooks;

  User(this.userName, this.firstName, this.secondName, this.myBooks);

  User.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    firstName = json['firstName'];
    secondName = json['secondName'];
    myBooks = json['myBooks'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['userName'] = userName;
    json['firstName'] = firstName;
    json['secondName'] = secondName;
    return json;
  }
}
