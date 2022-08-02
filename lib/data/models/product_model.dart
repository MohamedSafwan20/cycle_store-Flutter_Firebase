import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String id;
  String name;
  num stock;
  double price;
  List sizes;
  Map thumbnail;
  List images;
  num buyCount;
  String storageId;
  String category;
  bool isTrending;
  Timestamp createdAt;
  Map specs;

  Product({
    required this.id,
    required this.name,
    required this.stock,
    required this.price,
    required this.sizes,
    required this.thumbnail,
    required this.images,
    required this.createdAt,
    required this.buyCount,
    required this.storageId,
    required this.category,
    required this.isTrending,
    required this.specs,
  });

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        stock = json['stock'],
        price = json['price'].toDouble(),
        sizes = json['sizes'],
        thumbnail = json['thumbnail'],
        images = json['images'],
        buyCount = json['buy_count'],
        category = json['category'],
        storageId = json['storage_id'],
        isTrending = json['is_trending'],
        specs = json['specs'],
        createdAt = json["created_at"];

  Product.toProduct(Map data)
      : id = data['id'],
        name = data['name'],
        stock = data['stock'],
        price = data['price'].toDouble(),
        sizes = data['sizes'],
        thumbnail = data['thumbnail'],
        images = data['images'],
        buyCount = data['buy_count'],
        category = data['category'],
        storageId = data['storage_id'],
        isTrending = data['is_trending'],
        specs = data['specs'],
        createdAt = data["created_at"];

  @override
  String toString() {
    return "name - $name, category - $category, price - $price";
  }
}
