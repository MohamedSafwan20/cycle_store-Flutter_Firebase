import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ImageViewerController extends GetxController {
  final carouselController = PageController();
  final images = Get.arguments["images"] as List;

  RxInt currentCarouselImage = 0.obs;

  void onCarouselChange(int currentIndex) =>
      currentCarouselImage.value = currentIndex;
}
