import 'package:carousel_slider/carousel_controller.dart';
import 'package:cycle_store/data/models/product_model.dart';
import 'package:cycle_store/data/services/product_service.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  final carouselController = CarouselController();
  final product = Get.arguments["product"] as Product;

  RxList images = [].obs;
  RxInt currentCarouselImage = 0.obs;
  RxInt selectedSizeIndex = 0.obs;
  RxBool isProductInCart = false.obs;
  RxList<String> productsInCart = <String>[].obs;

  ProductDetailsController() {
    images.value = product.images.map((e) => e["url"]).toList();
  }

  @override
  void onInit() {
    ProductService.isProductInCart(product.id).then((res) {
      if (res["status"]) {
        isProductInCart.value = true;
      }
    });

    super.onInit();
  }

  void onCarouselChange(currentIndex, _) =>
      currentCarouselImage.value = currentIndex;

  void onCarouselIndicatorChange(int currentIndex) {
    currentCarouselImage.value = currentIndex;
    carouselController.animateToPage(currentIndex);
  }

  void onSizeChange({required int selectedSize}) =>
      selectedSizeIndex.value = selectedSize;

  void addToCart() {
    ProductService.addToCart(product.id).then((res) {
      if (!res["status"]) {
        throw Exception("Failed to add to cart");
      }

      productsInCart.add(product.id);
    });
  }

  void removeFromCart() {
    ProductService.removeFromCart(product.id).then((res) {
      if (!res["status"]) {
        throw Exception("Failed to remove from cart");
      }

      productsInCart.remove(product.id);
    });
  }
}
