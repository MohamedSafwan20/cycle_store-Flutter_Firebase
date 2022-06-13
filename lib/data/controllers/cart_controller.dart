import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/data/controllers/home_controller.dart';
import 'package:cycle_store/data/services/product_service.dart';
import 'package:cycle_store/data/services/user_service.dart';
import 'package:cycle_store/utils/utils.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final _homeController = Get.find<HomeController>();

  RxList products = [].obs;
  RxList checkoutProducts = [].obs;
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

    UserService.getAllCartProducts().then((res) {
      if (!res["status"]) {
        throw Exception("Failed to fetch Cart products");
      }

      products.value = res["data"];
      checkoutProducts.value = res["data"];

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

  void deleteCartItem({required String productId,
    required String size,
    required double productPrice}) {
    ProductService.removeFromCart(productId).then((res) {
      if (!res["status"]) {
        throw Exception();
      }

      checkoutProducts.value = products.where((product) {
        return product["product"].id != productId;
      }).toList();

      price.value -= productPrice;
      // Updating product card cart button
      _homeController.removeFromCart(productId);
    }).catchError((e) {
      getAllCartProducts();
      Utils.showErrorSnackbar(text: "Failed to delete Cart Item");
    });
  }

  void handleProceedBtn() {
    List sizes = checkoutProducts.map((product) {
      return product["size"];
    }).toList();

    Get.toNamed(CHECKOUT_ROUTE, arguments: {
      "products": checkoutProducts,
      "quantities": quantities,
      "sizes": sizes
    });
  }
}
