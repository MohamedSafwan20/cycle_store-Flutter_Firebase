import 'package:cycle_store/data/services/user_service.dart';
import 'package:cycle_store/utils/utils.dart';
import 'package:get/get.dart';

class MyOrdersController extends GetxController {
  RxInt selectedTab = 0.obs;
  RxList orders = [].obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getAllOrders();

    super.onInit();
  }

  void onTabChange({required int currentTab}) => selectedTab.value = currentTab;

  void getAllOrders() {
    isLoading.value = true;

    UserService.getAllOrders().then((res) {
      isLoading.value = false;

      if (!res["status"]) {
        throw Exception();
      }

      orders.value = res["data"];
    }).catchError((e) {
      isLoading.value = false;

      orders.value = [];
      Utils.showErrorSnackbar(
          text: "Failed to get orders. Please try again later.");
    });
  }
}
