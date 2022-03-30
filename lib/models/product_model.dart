import 'package:do_an/models/img_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class Product {
  int? id;
  String? code;
  String? name;
  String? description;
  int? quantity;
  int? price;
  String? cpu;
  String? ram;
  String? screen;
  String? vga;
  String? storage;
  String? operatingSystem;
  String? battery;
  int? featured;
  int? categoryId;
  int? subCategoryId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  List<Img>? img;

  Product(
      {this.id,
      this.code,
      this.name,
      this.description,
      this.quantity,
      this.price,
      this.cpu,
      this.ram,
      this.screen,
      this.vga,
      this.storage,
      this.operatingSystem,
      this.battery,
      this.featured,
      this.categoryId,
      this.subCategoryId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.img
      });

 factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  //Map<String, dynamic> toJson() =>_$ProductToJson(this);
}

