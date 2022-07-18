import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class CustomCarouselController extends GetxController {
  final carouselController = CarouselController();

  RxList images = [
    "https://picsum.photos/200/200",
    "https://picsum.photos/200/300",
    "https://picsum.photos/300/200"
  ].obs;
  RxInt currentCarouselImage = 0.obs;

  void onCarouselChange(currentIndex, _) =>
      currentCarouselImage.value = currentIndex;

  void onCarouselIndicatorChange(int currentIndex) {
    currentCarouselImage.value = currentIndex;
    carouselController.animateToPage(currentIndex);
  }
}
