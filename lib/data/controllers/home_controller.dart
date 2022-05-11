import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentPageIndex = 0.obs;

  void onPageChange({required int index}) {
    currentPageIndex.value = index;
  }
}
