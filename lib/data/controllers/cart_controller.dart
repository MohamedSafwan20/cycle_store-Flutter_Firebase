import 'package:cycle_store/data/services/product_service.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList products = [].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getAllCartProducts();

    super.onInit();
  }

  void getAllCartProducts() {
    isLoading.value = true;

    ProductService.getAllCartProducts().then((res) {
      if (!res["status"]) {
        throw Exception("Failed to fetch Cart products");
      }

      products.value = res["data"];
      isLoading.value = false;
    }).catchError((e) {
      isLoading.value = false;
    });
  }
}
