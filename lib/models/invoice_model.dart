import 'package:do_an/models/invoice_detail_model.dart';

class Invoice {
  int? id;
  String? code;
  int? accountId;
  int? shippingId;
  String? address;
  int? total;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  List<InvoiceDetail>? detail;

  Invoice(
      {this.id,
      this.code,
      this.accountId,
      this.shippingId,
      this.address,
      this.total,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.detail});

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        id: json['id'],
        code: json['code'],
        accountId: json['account_id'],
        shippingId: json['shipping_id'],
        address: json['address'],
        total: json['total'],
        status: json['status'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        deletedAt: json['deleted_at'],
        detail: (json['detail'] as List)
            .map((e) => InvoiceDetail.fromJson(e))
            .toList(),
      );

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['code'] = this.code;
  //   data['account_id'] = this.accountId;
  //   data['shipping_id'] = this.shippingId;
  //   data['address'] = this.address;
  //   data['total'] = this.total;
  //   data['status'] = this.status;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   data['deleted_at'] = this.deletedAt;
  //   if (this.detail != null) {
  //     data['detail'] = this.detail!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}
