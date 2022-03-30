class Shipping {
  int? id;
  String? name;
  int? price;

  Shipping({this.id, this.name, this.price});

  factory Shipping.fromJson(Map<String, dynamic> json) {
    return Shipping(
      id: json['id'],
      name: json['name'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}
