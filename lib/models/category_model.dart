import 'package:do_an/models/sub_category_model.dart';

class Category {
  int? id;
  String? name;
  String? image;
  List<SubCategory>? sub;

  Category({this.id, this.name, this.image, this.sub});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      sub: (json['sub'] as List<dynamic>)
          .map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
