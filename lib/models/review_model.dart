class Review {
  int? id;
  int? accountId;
  int? productId;
  int? vote;
  String? comments;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Review(
      {this.id,
      this.accountId,
      this.productId,
      this.vote,
      this.comments,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      accountId: json['account_id'],
      productId: json['product_id'],
      vote: json['vote'],
      comments: json['comments'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['account_id'] = this.accountId;
    data['product_id'] = this.productId;
    data['vote'] = this.vote;
    data['comments'] = this.comments;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
