import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cycle_store/data/models/product_model.dart';
import 'package:cycle_store/data/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProductService {
  static Future<Map> getCarouselImages({required String folder}) async {
    try {
      ListResult images =
          await FirebaseStorage.instance.ref("carousel_images/$folder/").list();

      List data = await Future.wait(images.items.map((ref) async {
        return await ref.getDownloadURL();
      }));

      return {"status": true, "data": data};
    } catch (e) {
      return {"status": false, "data": []};
    }
  }

  static Future<Map> getAllProducts() async {
    try {
      QuerySnapshot res =
          await FirebaseFirestore.instance.collection("products").get();

      List<Product> data = res.docs.map((e) {
        Map data = {"id": e.id, ...e.data() as Map};

        return Product.toProduct(data);
      }).toList();

      return {"status": true, "data": data};
    } catch (e) {
      return {"status": false, "data": []};
    }
  }

  static Future<Map> getProductsByCategory(String category) async {
    try {
      QuerySnapshot res = await FirebaseFirestore.instance
          .collection("products")
          .where("category", isEqualTo: category)
          .get();

      List<Product> data = res.docs.map((e) {
        Map data = {"id": e.id, ...e.data() as Map};

        return Product.toProduct(data);
      }).toList();

      return {"status": true, "data": data};
    } catch (e) {
      return {"status": false, "data": []};
    }
  }

  static Future<Map> getProductsByName(String searchText) async {
    try {
      Map res = await getAllProducts();
      if (!res["status"]) throw Exception("Failed to fetch all products");
      List<Product> allProducts = res["data"];

      List<Product> data = allProducts.where((product) {
        return product.name.toUpperCase().contains(searchText.toUpperCase()) ||
            product.category.toUpperCase().contains(searchText.toUpperCase()) ||
            product.brand.toUpperCase().contains(searchText.toUpperCase()) ||
            product.searchKeywords.any((element) =>
                element.toUpperCase().contains(searchText.toUpperCase()));
      }).toList();

      return {"status": true, "data": data};
    } catch (e) {
      return {"status": false, "data": []};
    }
  }

  static Future<Map> addToCart(
      {required String productId, required String size}) async {
    try {
      User user = AuthService.getCurrentUser();

      final productRef =
          FirebaseFirestore.instance.collection("products").doc(productId);

      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .update({
        "cart": FieldValue.arrayUnion([
          {"item": productRef, "size": size}
        ]),
      });

      return {"status": true};
    } catch (e) {
      return {"status": false};
    }
  }

  static Future<Map> removeFromCart(String productId) async {
    try {
      User user = AuthService.getCurrentUser();

      final productRef =
          FirebaseFirestore.instance.collection("products").doc(productId);

      final res = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();
      final data = res.data() as Map;

      final cartData = data["cart"].where((item) {
        return item["item"] != productRef;
      }).toList();

      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .update({"cart": cartData});

      return {"status": true};
    } catch (e) {
      return {"status": false};
    }
  }

  static Future<Map> isProductInCart(String productId) async {
    try {
      User user = AuthService.getCurrentUser();

      final productsRef = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();

      final data = productsRef.data() as Map;

      final isInCart = data["cart"].any((item) {
        return item["item"].id == productId;
      });

      if (isInCart) {
        return {"status": true};
      }

      return {"status": false};
    } catch (e) {
      return {"status": false};
    }
  }
}
