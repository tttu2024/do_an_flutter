class SubCategory {
  int? id;
  String? name;

  SubCategory({this.id, this.name});

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
     id : json['id'],
    name : json['name'],
    );   
  }
}
  