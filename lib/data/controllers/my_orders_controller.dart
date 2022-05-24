import 'package:get/get.dart';

class MyOrdersController extends GetxController {
  RxInt selectedTab = 0.obs;

  void onTabChange({required int currentTab}) => selectedTab.value = currentTab;
}
