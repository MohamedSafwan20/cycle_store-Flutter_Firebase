import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  final carouselController = CarouselController();

  final images = [
    "assets/images/product.png",
    "assets/images/product2.png",
    "assets/images/logo.jpg"
  ];
  RxInt currentCarouselImage = 0.obs;

  RxInt selectedSizeIndex = 0.obs;

  void onCarouselChange(currentIndex, _) =>
      currentCarouselImage.value = currentIndex;

  void onCarouselIndicatorChange(int currentIndex) {
    currentCarouselImage.value = currentIndex;
    carouselController.animateToPage(currentIndex);
  }

  void onSizeChange({required int selectedSize}) =>
      selectedSizeIndex.value = selectedSize;
}
