class Cart {
  String id;
  String size;

  Cart({
    required this.id,
    required this.size,
  });

  Cart.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        size = json['size'];

  Cart.toCart(Map data)
      : id = data['id'],
        size = data['size'];

  @override
  String toString() {
    return "id - $id, size - $size";
  }
}
