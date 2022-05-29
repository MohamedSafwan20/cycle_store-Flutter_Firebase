import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxInt currentPageIndex = 0.obs;

  void onPageChange({required int index}) {
    currentPageIndex.value = index;
  }
}
