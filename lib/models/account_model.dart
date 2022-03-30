class Account {
  int? id;
  String? email;
  String? password;
  String? fullName;
  int? sex;
  String? address;
  String? phone;
  String? birthday;
  String? avatar;
  int? isAdmin;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Account(
      {this.id,
      this.email,
      this.password,
      this.fullName,
      this.sex,
      this.address,
      this.phone,
      this.birthday,
      this.avatar,
      this.isAdmin,
      this.createdAt,
      this.updatedAt,
      this.deletedAt
      });

  factory Account.fromJson(Map<String , dynamic> json)=>Account(
     id:json['id'],
   email:json['email'],
    password:json['password'],
    fullName:json['full_name'],
    sex:json['sex'],
    address:json['address'],
    phone:json['phone'],
    birthday:json['birthday'],
    avatar:json['avatar'],
    isAdmin:json['is_admin'],
    createdAt:json['created_at'],
    updatedAt:json['updated_at'],
    deletedAt:json['deleted_at'],
  );

Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;
    data['full_name'] = this.fullName;
    data['sex'] = this.sex;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['birthday'] = this.birthday;
    data['avatar'] = this.avatar;
    data['is_admin'] = this.isAdmin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}