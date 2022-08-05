import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class CustomCarouselController extends GetxController {
  final carouselController = CarouselController();

  RxInt currentCarouselImage = 0.obs;

  void onCarouselChange(currentIndex, _) =>
      currentCarouselImage.value = currentIndex;

  void onCarouselIndicatorChange(int currentIndex) {
    currentCarouselImage.value = currentIndex;
    carouselController.animateToPage(currentIndex);
  }
}
