import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cycle_store/data/models/address_model.dart';
import 'package:cycle_store/data/services/auth_service.dart';

class UserService {
  static Future<Map> addAddress(Address address,
      {bool isDefault = false}) async {
    try {
      final user = AuthService.getCurrentUser();

      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .update({
        "addresses": FieldValue.arrayUnion([
          {
            "address": {
              "name": address.name,
              "phone": address.phone,
              "pincode": address.pincode,
              "city": address.city,
              "state": address.state,
              "locality": address.locality,
              "landmark": address.landmark,
            },
            "isDefault": isDefault
          }
        ])
      });

      return {"status": true};
    } catch (e) {
      return {"status": false};
    }
  }
}
