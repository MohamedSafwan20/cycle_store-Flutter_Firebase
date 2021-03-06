import 'package:cycle_store/data/models/product_model.dart';
import 'package:cycle_store/data/services/product_service.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxInt currentCategory = 0.obs;

  RxList<Product> products = <Product>[].obs;
  RxBool isLoading = false.obs;

  void onCategoryChange({required int index}) {
    currentCategory.value = index;

    switch (index) {
      case 0:
        getAllProducts();
        break;
      case 1:
        getProductsByCategory("ROADBIKE");
        break;
      case 2:
        getProductsByCategory("MOUNTAIN");
        break;
      case 3:
        getProductsByCategory("KIDS");
        break;
      case 4:
        getProductsByCategory("URBAN");
        break;
    }
  }

  void getAllProducts() {
    isLoading.value = true;

    ProductService.getAllProducts().then((value) {
      if (!value["status"]) throw Exception("Couldn't get products");

      products.value = value["data"];
      isLoading.value = false;
    }).catchError((e) {
      isLoading.value = false;
    });
  }

  void getProductsByCategory(String category) {
    isLoading.value = true;

    ProductService.getProductsByCategory(category).then((value) {
      if (!value["status"]) {
        throw Exception("Couldn't get products by category");
      }

      products.value = value["data"];
      isLoading.value = false;
    }).catchError((e) {
      isLoading.value = false;
    });
  }
}
