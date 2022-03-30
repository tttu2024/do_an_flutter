// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      quantity: json['quantity'] as int?,
      price: json['price'] as int?,
      cpu: json['cpu'] as String?,
      ram: json['ram'] as String?,
      screen: json['screen'] as String?,
      vga: json['vga'] as String?,
      storage: json['storage'] as String?,
      operatingSystem: json['operating_system'] as String?,
      battery: json['battery'] as String?,
      featured: json['featured'] as int?,
      categoryId: json['category_id'] as int?,
      subCategoryId: json['sub_category_id'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
      img: (json['img'] as List<dynamic>?)
          ?.map((e) => Img.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'quantity': instance.quantity,
      'price': instance.price,
      'cpu': instance.cpu,
      'ram': instance.ram,
      'screen': instance.screen,
      'vga': instance.vga,
      'storage': instance.storage,
      'operatingSystem': instance.operatingSystem,
      'battery': instance.battery,
      'featured': instance.featured,
      'categoryId': instance.categoryId,
      'subCategoryId': instance.subCategoryId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
      'img': instance.img?.map((e) => e.toJson()).toList(),
    };
