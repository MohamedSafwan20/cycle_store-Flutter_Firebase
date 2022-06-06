import 'package:cycle_store/data/models/product_model.dart';
import 'package:cycle_store/data/services/product_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Product> newArrivals = <Product>[].obs;
  RxList<Product> topSelling = <Product>[].obs;
  RxList<Product> cartProducts = <Product>[].obs;
  RxList<String> productsInCart = <String>[].obs;

  RxBool isNewArrivalsLoading = false.obs;
  RxBool isTopSellingLoading = false.obs;

  @override
  void onInit() {
    getNewArrivedProducts();
    getTopSellingProducts();
    getAllCartProducts();

    super.onInit();
  }

  void getNewArrivedProducts() {
    isNewArrivalsLoading.value = true;

    ProductService.getNewArrivedProducts().then((res) {
      if (!res["status"]) throw Exception("Failed to get new arrived products");

      newArrivals.value = res["data"];

      isNewArrivalsLoading.value = false;
    }).catchError((e) {
      isNewArrivalsLoading.value = false;
    });
  }

  void getTopSellingProducts() {
    isTopSellingLoading.value = true;

    ProductService.getTopSellingProducts().then((res) {
      if (!res["status"]) throw Exception("Failed to get top selling products");

      topSelling.value = res["data"];

      isTopSellingLoading.value = false;
    }).catchError((e) {
      isTopSellingLoading.value = false;
    });
  }

  void addToCart(String productId) {
    ProductService.addToCart(productId).then((res) {
      if (!res["status"]) {
        throw Exception("Failed to add to cart");
      }

      productsInCart.add(productId);
    });
  }

  void removeFromCart(String productId) {
    ProductService.removeFromCart(productId).then((res) {
      if (!res["status"]) {
        throw Exception("Failed to remove from cart");
      }

      productsInCart.remove(productId);
    });
  }

  void getAllCartProducts() {
    isNewArrivalsLoading.value = true;
    isTopSellingLoading.value = true;

    ProductService.getAllCartProducts().then((res) {
      if (!res["status"]) throw Exception("Failed to get cart products");

      cartProducts.value = res["data"];

      isNewArrivalsLoading.value = false;
      isTopSellingLoading.value = false;
    }).catchError((e) {
      isNewArrivalsLoading.value = false;
      isTopSellingLoading.value = false;
    });
  }
}
