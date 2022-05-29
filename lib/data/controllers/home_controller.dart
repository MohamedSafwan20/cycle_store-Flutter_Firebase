import 'package:cycle_store/data/models/product_model.dart';
import 'package:cycle_store/data/services/product_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Product> newArrivals = <Product>[].obs;

  RxBool isLoading = false.obs;

  void getNewArrivedProducts() {
    isLoading.value = true;

    ProductService.getNewArrivedProducts().then((res) {
      if (!res["status"]) throw Exception();

      newArrivals.value = res["data"];

      isLoading.value = false;
    }).catchError((e) {
      isLoading.value = false;
    });
  }
}
