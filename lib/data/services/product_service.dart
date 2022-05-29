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
        return Product.toProduct(e.data() as Map);
      }).toList();

      return {"status": true, "data": data};
    } catch (e) {
      return {"status": false, "data": []};
    }
  }
}
