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
}
