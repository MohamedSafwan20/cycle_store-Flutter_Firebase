import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cycle_store/data/models/address_model.dart';
import 'package:cycle_store/data/services/auth_service.dart';

class UserService {
  static Future<Map> addAddress(Address address,
      {bool isDefault = false}) async {
    try {
      final user = AuthService.getCurrentUser();

      if (isDefault) {
        final res = await FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .get();
        final data = res.data() as Map;

        List addresses = [];
        if (data["addresses"] != null) {
          addresses = data["addresses"].map((address) {
            return {"address": address["address"], "isDefault": false};
          }).toList();
        }

        addresses.add({
          "address": {
            "name": address.name,
            "phone": address.phone,
            "pincode": address.pincode,
            "city": address.city,
            "state": address.state,
            "locality": address.locality,
            "landmark": address.landmark,
          },
          "isDefault": true
        });

        await FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .set({"addresses": addresses});

        return {"status": true};
      }

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
            "isDefault": false
          }
        ])
      });

      return {"status": true};
    } catch (e) {
      return {"status": false};
    }
  }

  static Future<Map> getAllAddresses() async {
    try {
      final user = AuthService.getCurrentUser();

      final res = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();
      final data = res.data() as Map;

      if (data["addresses"] == null || data["addresses"].isEmpty) {
        return {"status": true, "data": []};
      }

      List addresses = data["addresses"].map((address) {
        Map data = {"isDefault": address["isDefault"], ...address["address"]};

        return Address.toAddress(data);
      }).toList();

      return {"status": true, "data": addresses.reversed.toList()};
    } catch (e) {
      return {"status": false, "data": []};
    }
  }
}
