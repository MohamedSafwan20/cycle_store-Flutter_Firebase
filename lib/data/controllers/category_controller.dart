import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxInt currentCategory = 0.obs;

  void onCategoryChange({required int index}) {
    currentCategory.value = index;
  }
}
