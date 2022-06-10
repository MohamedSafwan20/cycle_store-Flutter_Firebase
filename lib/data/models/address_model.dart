class Address {
  String name;
  String phone;
  String pincode;
  String city;
  String state;
  String locality;
  String landmark;
  bool? isDefault;

  Address({
    required this.name,
    required this.phone,
    required this.pincode,
    required this.city,
    required this.state,
    required this.locality,
    required this.landmark,
    this.isDefault,
  });

  Address.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        phone = json['phone'],
        pincode = json['pincode'],
        city = json['city'],
        state = json['state'],
        locality = json['locality'],
        landmark = json['landmark'],
        isDefault = json['isDefault'] ?? false;

  Address.toAddress(Map data)
      : name = data['name'],
        phone = data['phone'],
        pincode = data['pincode'],
        city = data['city'],
        state = data['state'],
        locality = data['locality'],
        landmark = data['landmark'],
        isDefault = data['isDefault'] ?? false;

  @override
  String toString() {
    return "name - $name, phone - $phone";
  }
}
