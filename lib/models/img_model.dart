


class Img {
  String? path;

  Img({this.path});

  factory Img.fromJson(Map<String, dynamic> json) {
    return Img(path: json['path']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = path;
    return data;
  }
}
