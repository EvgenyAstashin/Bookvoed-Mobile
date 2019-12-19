class AvatarUploadingRequest {
  String avatarBase64;
  String extension;

  AvatarUploadingRequest(this.avatarBase64, this.extension);

  Map<String, dynamic> toJson() {
    var json = Map<String, dynamic>();
    json['avatarBase64'] = avatarBase64;
    json['extension'] = extension;
    return json;
  }
}