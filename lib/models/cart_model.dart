class Cart {
  int? id;
  int? productId;
  String? productName;
  int? unitPrice;
  int? quantity;
  int? totalPrice;
  String? image;

  Cart({
    this.id,
    required this.productId,
    this.productName,
    this.unitPrice,
    this.quantity,
    this.totalPrice,
    this.image,
  });

  Cart.fromMap(Map<dynamic, dynamic> json)
      : id = json['id'],
        productId = json['productId'],
        productName = json['productName'],
        unitPrice = json['unitPrice'],
        quantity = json['quantity'],
        totalPrice = json['totalPrice'],
        image = json['image'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
      'unitPrice': unitPrice,
      'quantity': quantity,
      'totalPrice': totalPrice,
      'image': image,
    };
  }

}
