class BackImage {
  String? title;
  String? pathImage;
  BackImage({this.title, this.pathImage});
  BackImage.fromJson(Map<String, dynamic> json) {
    title = json['id'];
    pathImage = json['email'];
  }
}
