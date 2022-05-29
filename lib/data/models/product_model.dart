import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String name;
  String description;
  num stock;
  num price;
  List sizes;
  String thumbnail;
  List images;
  num buyCount;
  Timestamp createdAt;

  Product(
      {required this.name,
      required this.description,
      required this.stock,
      required this.price,
      required this.sizes,
      required this.thumbnail,
      required this.images,
      required this.createdAt,
      required this.buyCount});

  Product.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        stock = json['stock'],
        price = json['price'],
        sizes = json['sizes'],
        thumbnail = json['thumbnail'],
        images = json['images'],
        buyCount = json['buy_count'],
        createdAt = json["created_at"];

  Product.toProduct(Map data)
      : name = data['name'],
        description = data['description'],
        stock = data['stock'],
        price = data['price'],
        sizes = data['sizes'],
        thumbnail = data['thumbnail'],
        images = data['images'],
        buyCount = data['buy_count'],
        createdAt = data["created_at"];

  @override
  String toString() {
    return "name - $name, description - $description, price - $price";
  }
}
