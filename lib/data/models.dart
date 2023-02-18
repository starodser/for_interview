class BackImage {
  String? title;
  String? pathImage;
  BackImage({required this.title, required this.pathImage});
  factory BackImage.fromJson(Map<String, dynamic> json) {
    return BackImage(title: json['title'], pathImage: json['url']);
  }
}
