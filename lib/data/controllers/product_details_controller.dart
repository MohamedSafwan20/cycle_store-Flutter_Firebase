import 'package:carousel_slider/carousel_controller.dart';
import 'package:cycle_store/data/models/product_model.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  final carouselController = CarouselController();
  final product = Get.arguments["product"] as Product;

  RxList images = [].obs;
  RxInt currentCarouselImage = 0.obs;
  RxInt selectedSizeIndex = 0.obs;

  ProductDetailsController() {
    images.value = product.images.map((e) => e["url"]).toList();
  }

  void onCarouselChange(currentIndex, _) =>
      currentCarouselImage.value = currentIndex;

  void onCarouselIndicatorChange(int currentIndex) {
    currentCarouselImage.value = currentIndex;
    carouselController.animateToPage(currentIndex);
  }

  void onSizeChange({required int selectedSize}) =>
      selectedSizeIndex.value = selectedSize;
}
