import 'package:cycle_store/data/models/product_model.dart';
import 'package:cycle_store/data/services/product_service.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  String searchText = Get.arguments["searchText"];

  RxList<Product> products = <Product>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    switch (searchText.toUpperCase()) {
      case "POPULAR":
        products.value = Get.arguments["products"];
        break;
      case "TRENDING":
        products.value = Get.arguments["products"];
        break;
      default:
        getProducts();
    }

    super.onInit();
  }

  void getProducts() {
    isLoading.value = true;
    ProductService.getProductsByName(searchText).then((res) {
      if (!res["status"]) throw Exception("Failed to fetch product by name");

      products.value = res["data"];
      isLoading.value = false;
    }).catchError((e) {
      isLoading.value = false;
    });
  }
}
