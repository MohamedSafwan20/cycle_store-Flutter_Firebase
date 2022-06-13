import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cycle_store/data/models/address_model.dart';
import 'package:cycle_store/data/models/product_model.dart';
import 'package:cycle_store/data/services/auth_service.dart';
import 'package:cycle_store/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserService {
  static Future<Map> addAddress(Address address,
      {bool isDefault = false}) async {
    try {
      final user = AuthService.getCurrentUser();

      final res = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();
      final data = res.data() as Map;

      if (isDefault) {
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

      // adding the first address of user
      if (data["addresses"] == null || data["addresses"].isEmpty) {
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
              "isDefault": true
            }
          ])
        });

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

  static Future<Map> makeAddressDefault(Address address) async {
    try {
      final user = AuthService.getCurrentUser();
      final addressMap = {
        "name": address.name,
        "phone": address.phone,
        "pincode": address.pincode,
        "city": address.city,
        "state": address.state,
        "locality": address.locality,
        "landmark": address.landmark,
      };

      final res = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();
      final data = res.data() as Map;

      List addresses = data["addresses"].map((item) {
        if (mapEquals(item["address"] as Map, addressMap)) {
          return {"address": item["address"], "isDefault": true};
        }

        return {"address": item["address"], "isDefault": false};
      }).toList();

      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .set({"addresses": addresses});

      List formattedAddresses = addresses.map((address) {
        Map data = {"isDefault": address["isDefault"], ...address["address"]};

        return Address.toAddress(data);
      }).toList();

      return {"status": true, "data": formattedAddresses.reversed.toList()};
    } catch (e) {
      return {"status": false, "data": []};
    }
  }

  static Future<Map> updateAddress(Address address,
      {bool isDefault = false, required Map oldAddress}) async {
    try {
      final user = AuthService.getCurrentUser();

      Map newAddressMap = {
        "name": address.name,
        "phone": address.phone,
        "pincode": address.pincode,
        "city": address.city,
        "state": address.state,
        "locality": address.locality,
        "landmark": address.landmark,
      };

      final res = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();
      final data = res.data() as Map;

      List addresses = data["addresses"].map((item) {
        if (mapEquals(item["address"] as Map, oldAddress)) {
          return {"address": newAddressMap, "isDefault": isDefault};
        }

        return {"address": item["address"], "isDefault": false};
      }).toList();

      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .set({"addresses": addresses});

      return {"status": true};
    } catch (e) {
      return {"status": false};
    }
  }

  static Future<Map> deleteAddress(Address address,
      {bool isDefault = false}) async {
    try {
      final user = AuthService.getCurrentUser();

      Map addressMap = {
        "name": address.name,
        "phone": address.phone,
        "pincode": address.pincode,
        "city": address.city,
        "state": address.state,
        "locality": address.locality,
        "landmark": address.landmark,
      };

      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .update({
        "addresses": FieldValue.arrayRemove([
          {"address": addressMap, "isDefault": isDefault}
        ])
      });

      return {"status": true};
    } catch (e) {
      return {"status": false};
    }
  }

  static Future<Map> updateDisplayName(String name) async {
    try {
      User user = AuthService.getCurrentUser();

      await user.updateDisplayName(name);

      return {"status": true};
    } catch (e) {
      return {"status": false};
    }
  }

  static updateEmail(String email) async {
    try {
      User user = AuthService.getCurrentUser();

      await user.updateEmail(email);

      return {"status": true};
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        Utils.showErrorSnackbar(text: "Email already exists");
        return {"status": false};
      }
    } catch (e) {
      Utils.showErrorSnackbar(text: "Failed to update email");
      return {"status": false};
    }
  }

  static Future<Map> getAllCartProducts() async {
    try {
      User user = AuthService.getCurrentUser();

      final productsRef = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();

      final cartData = productsRef.data() as Map;
      List cartList = cartData["cart"];

      List<Map> productData = await Future.wait(cartList.map((item) async {
        DocumentSnapshot snapshot = await item["item"].get();
        Map data = {"id": snapshot.id, ...snapshot.data() as Map};

        return {"product": Product.toProduct(data), "size": item["size"]};
      }), eagerError: true);

      return {"status": true, "data": productData};
    } catch (e) {
      return {"status": false, "data": []};
    }
  }

  static Future<Map> getDefaultAddress() async {
    try {
      final user = AuthService.getCurrentUser();

      final res = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();
      final data = res.data() as Map;

      if (data["addresses"] == null || data["addresses"].isEmpty) {
        return {"status": true, "data": null};
      }

      Address? defaultAddress;
      for (Map address in data["addresses"]) {
        if (address["isDefault"]) {
          defaultAddress = Address.toAddress(address["address"]);
          break;
        }
      }

      if (defaultAddress == null) {
        return {"status": true, "data": null};
      }

      return {"status": true, "data": defaultAddress};
    } catch (e) {
      return {"status": false};
    }
  }

  static Future<Map> placeOrder(
      {required List products,
      required Address address,
      required List quantities}) async {
    try {
      final user = AuthService.getCurrentUser();

      // Updating products details in products collection
      for (int i = 0; i < products.length; i++) {
        DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection("products")
            .doc(products[i]["product"].id)
            .get();
        Map data = snapshot.data() as Map;

        await FirebaseFirestore.instance
            .collection("products")
            .doc(products[i]["product"].id)
            .update({
          "buy_count": data["buy_count"] + quantities[i],
          "stock": data["stock"] - quantities[i],
        });
      }

      List<Map> orders = products.asMap().entries.map((entry) {
        DocumentReference productRef = FirebaseFirestore.instance
            .collection("products")
            .doc(entry.value["product"].id);

        return {
          "product": productRef,
          "customerAddress":
              "${address.locality}, ${address.city}, ${address.state} - ${address.pincode}\n${address.landmark}",
          "customerName": address.name,
          "customerPhone": address.phone,
          "price": entry.value["product"].price,
          "quantity": quantities[entry.key],
          "status": "NEW"
        };
      }).toList();

      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .update({"orders": FieldValue.arrayUnion(orders)});

      return {
        "status": true,
      };
    } catch (e) {
      return {
        "status": false,
      };
    }
  }
}
