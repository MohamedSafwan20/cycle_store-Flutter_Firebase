import 'package:cycle_store/data/services/product_service.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList products = [].obs;
  RxBool isLoading = false.obs;
  RxList quantities = [].obs;
  RxDouble price = 0.0.obs;

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

      quantities.value = res["data"].map((item) {
        price.value += item["product"].price;
        return 1;
      }).toList();
      isLoading.value = false;
    }).catchError((e) {
      isLoading.value = false;
    });
  }

  void increaseQuantity({required String productId, required int index}) {
    for (Map product in products) {
      if (product["product"].id == productId) {
        price.value += product["product"].price;
        break;
      }
    }

    quantities[index]++;
    update(["quantity - $productId"]);
  }

  void decreaseQuantity({required String productId, required int index}) {
    if (quantities[index] > 1) {
      for (Map product in products) {
        if (product["product"].id == productId) {
          price.value -= product["product"].price;
          break;
        }
      }

      quantities[index]--;
      update(["quantity - $productId"]);
    }
  }
}
