import 'package:do_an/models/product_model.dart';

class InvoiceDetail {
  int? id;
  int? invoiceId;
  int? productId;
  int? price;
  int? quantity;
  int? total;
  String? createdAt;
  String? updatedAt;
  Product? prd;

  InvoiceDetail(
      {this.id,
      this.invoiceId,
      this.productId,
      this.price,
      this.quantity,
      this.total,
      this.createdAt,
      this.updatedAt,
      this.prd});

  factory InvoiceDetail.fromJson(Map<String, dynamic> json) {
    return InvoiceDetail(
      id: json['id'],
      invoiceId: json['invoice_id'],
      productId: json['product_id'],
      price: json['price'],
      quantity: json['quantity'],
      total: json['total'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      prd: Product.fromJson(json['prd']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['invoice_id'] = this.invoiceId;
    data['product_id'] = this.productId;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['total'] = this.total;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
