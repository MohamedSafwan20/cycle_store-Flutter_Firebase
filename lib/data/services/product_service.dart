import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cycle_store/data/models/product_model.dart';

class ProductService {
  static Future<Map> getNewArrivedProducts() async {
    try {
      QuerySnapshot res = await FirebaseFirestore.instance
          .collection("products")
          .orderBy("created_at")
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

  static Future<Map> getTopSellingProducts() async {
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
        return product.name.toUpperCase().contains(searchText.toUpperCase());
      }).toList();

      return {"status": true, "data": data};
    } catch (e) {
      return {"status": false, "data": []};
    }
  }
}
