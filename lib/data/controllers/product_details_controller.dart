import 'package:carousel_slider/carousel_controller.dart';
import 'package:cycle_store/data/controllers/home_controller.dart';
import 'package:cycle_store/data/models/product_model.dart';
import 'package:cycle_store/data/services/product_service.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  final carouselController = CarouselController();
  final product = Get.arguments["product"] as Product;
  final HomeController _homeController = Get.find();

  RxList images = [].obs;
  RxInt currentCarouselImage = 0.obs;
  RxInt selectedSizeIndex = 0.obs;
  RxList<String> productsInCart = <String>[].obs;

  ProductDetailsController() {
    images.value = product.images.map((e) => e["url"]).toList();
  }

  @override
  void onInit() {
    ProductService.isProductInCart(product.id).then((res) {
      if (res["status"]) {
        productsInCart.add(product.id);
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
    // Updating cart button on home's product card
    _homeController.addToCart(product.id);

    productsInCart.add(product.id);
  }

  void removeFromCart() {
    // Updating cart button on home's product card
    _homeController.removeFromCart(product.id);

    productsInCart.remove(product.id);
  }
}
