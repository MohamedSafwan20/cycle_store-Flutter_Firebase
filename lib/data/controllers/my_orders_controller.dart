import 'package:cycle_store/data/services/user_service.dart';
import 'package:cycle_store/utils/utils.dart';
import 'package:get/get.dart';

class MyOrdersController extends GetxController {
  RxInt selectedTab = 0.obs;
  RxList shippingOrders = [].obs;
  RxList deliveredOrders = [].obs;
  RxList cancelledOrders = [].obs;

  RxBool isShippingOrdersLoading = false.obs;
  RxBool isDeliveredOrdersLoading = false.obs;
  RxBool isCancelledOrdersLoading = false.obs;

  @override
  void onInit() {
    getAllShippingOrders();
    getAllDeliveredOrders();
    getAllCancelledOrders();

    super.onInit();
  }

  void onTabChange({required int currentTab}) => selectedTab.value = currentTab;

  void getAllShippingOrders() {
    isShippingOrdersLoading.value = true;

    UserService.getAllShippingOrders().then((res) {
      isShippingOrdersLoading.value = false;

      if (!res["status"]) {
        throw Exception();
      }

      shippingOrders.value = res["data"];
    }).catchError((e) {
      isShippingOrdersLoading.value = false;

      shippingOrders.value = [];
      Utils.showErrorSnackbar(
          text: "Failed to get orders. Please try again later.");
    });
  }

  void getAllDeliveredOrders() {
    isDeliveredOrdersLoading.value = true;

    UserService.getAllDeliveredOrders().then((res) {
      isDeliveredOrdersLoading.value = false;

      if (!res["status"]) {
        throw Exception();
      }

      deliveredOrders.value = res["data"];
    }).catchError((e) {
      isDeliveredOrdersLoading.value = false;

      deliveredOrders.value = [];
      Utils.showErrorSnackbar(
          text: "Failed to get orders. Please try again later.");
    });
  }

  void getAllCancelledOrders() {
    isCancelledOrdersLoading.value = true;

    UserService.getAllCancelledOrders().then((res) {
      isCancelledOrdersLoading.value = false;

      if (!res["status"]) {
        throw Exception();
      }

      cancelledOrders.value = res["data"];
    }).catchError((e) {
      isCancelledOrdersLoading.value = false;

      cancelledOrders.value = [];
      Utils.showErrorSnackbar(
          text: "Failed to get orders. Please try again later.");
    });
  }
}
