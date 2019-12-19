class AvatarUploadingResponse {
  String uri;

  AvatarUploadingResponse(this.uri);

  AvatarUploadingResponse.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
  }
}

