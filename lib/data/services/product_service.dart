import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cycle_store/data/models/product_model.dart';
import 'package:cycle_store/data/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProductService {
  static Future<Map> getPopularProducts() async {
    try {
      QuerySnapshot res = await FirebaseFirestore.instance
          .collection("products")
          .orderBy("buy_count", descending: true)
          .limit(15)
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

  static Future<Map> getTrendingProducts() async {
    try {
      QuerySnapshot res = await FirebaseFirestore.instance
          .collection("products")
          .orderBy("is_trending", descending: true)
          .limit(15)
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
      if (searchText == "NEW_ARRIVALS") {
        Map res = await getPopularProducts();
        if (!res["status"]) {
          throw Exception("Failed to fetch newly arrived products");
        }

        return {"status": true, "data": res["data"] as List<Product>};
      }

      if (searchText == "TOP_SELLING") {
        Map res = await getTrendingProducts();
        if (!res["status"]) {
          throw Exception("Failed to fetch top selling products");
        }

        return {"status": true, "data": res["data"] as List<Product>};
      }

      Map res = await getAllProducts();
      if (!res["status"]) throw Exception("Failed to fetch all products");
      List<Product> allProducts = res["data"];

      List<Product> data = allProducts.where((product) {
        return product.name.toUpperCase().contains(searchText.toUpperCase());
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
