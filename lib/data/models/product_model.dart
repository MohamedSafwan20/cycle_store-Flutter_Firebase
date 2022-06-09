import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String id;
  String name;
  String description;
  num stock;
  double price;
  List sizes;
  Map thumbnail;
  List images;
  num buyCount;
  String storageId;
  String category;
  Timestamp createdAt;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.stock,
    required this.price,
    required this.sizes,
    required this.thumbnail,
    required this.images,
    required this.createdAt,
    required this.buyCount,
    required this.storageId,
    required this.category,
  });

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        stock = json['stock'],
        price = json['price'].toDouble(),
        sizes = json['sizes'],
        thumbnail = json['thumbnail'],
        images = json['images'],
        buyCount = json['buy_count'],
        category = json['category'],
        storageId = json['storage_id'],
        createdAt = json["created_at"];

  Product.toProduct(Map data)
      : id = data['id'],
        name = data['name'],
        description = data['description'],
        stock = data['stock'],
        price = data['price'].toDouble(),
        sizes = data['sizes'],
        thumbnail = data['thumbnail'],
        images = data['images'],
        buyCount = data['buy_count'],
        category = data['category'],
        storageId = data['storage_id'],
        createdAt = data["created_at"];

  @override
  String toString() {
    return "name - $name, description - $description, price - $price";
  }
}
