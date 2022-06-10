class Address {
  String? id;
  String name;
  String phone;
  String pincode;
  String city;
  String state;
  String locality;
  String landmark;

  Address({
    this.id,
    required this.name,
    required this.phone,
    required this.pincode,
    required this.city,
    required this.state,
    required this.locality,
    required this.landmark,
  });

  Address.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? "",
        name = json['name'],
        phone = json['phone'],
        pincode = json['pincode'],
        city = json['city'],
        state = json['state'],
        locality = json['locality'],
        landmark = json['landmark'];

  Address.toAddress(Map data)
      : id = data['id'] ?? "",
        name = data['name'],
        phone = data['phone'],
        pincode = data['pincode'],
        city = data['city'],
        state = data['state'],
        locality = data['locality'],
        landmark = data['landmark'];

  @override
  String toString() {
    return "id - $id, name - $name";
  }
}
