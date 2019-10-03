class IndustryIdentifier {
  String type;
  String identifier;

  IndustryIdentifier({this.type, this.identifier});

  IndustryIdentifier.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    identifier = json['identifier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['identifier'] = this.identifier;
    return data;
  }
}