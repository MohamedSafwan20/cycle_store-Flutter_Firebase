import 'package:cycle_store/data/models/product_model.dart';
import 'package:cycle_store/data/services/product_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Product> newArrivals = <Product>[].obs;
  RxList<Product> topSelling = <Product>[].obs;
  RxList<String> productsInCart = <String>[].obs;

  RxBool isNewArrivalsLoading = false.obs;
  RxBool isTopSellingLoading = false.obs;
  RxList<String> isCartBtnLoadingList = <String>[].obs;

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
    isCartBtnLoadingList.add(productId);
    ProductService.addToCart(productId).then((res) {
      isCartBtnLoadingList.remove(productId);

      if (res["status"]) {
        productsInCart.add(productId);
        update(["cartBtn - $productId"]);
      }
    });
  }

  void removeFromCart(String productId) {
    isCartBtnLoadingList.add(productId);
    ProductService.removeFromCart(productId).then((res) {
      isCartBtnLoadingList.remove(productId);

      if (res["status"]) {
        productsInCart.remove(productId);
        update(["cartBtn - $productId"]);
      }
    });
  }
}
