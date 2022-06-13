import 'package:cycle_store/data/controllers/my_orders_controller.dart';
import 'package:cycle_store/data/services/user_service.dart';
import 'package:cycle_store/utils/utils.dart';
import 'package:get/get.dart';

class OrderSummaryController extends GetxController {
  final _myOrdersController = Get.find<MyOrdersController>();
  Map order = Get.arguments["order"] as Map;

  RxBool isLoading = false.obs;

  void cancelOrder() {
    isLoading.value = true;

    UserService.cancelOrder(order).then((res) {
      isLoading.value = false;

      if (!res["status"]) {
        throw Exception();
      }

      _myOrdersController.getAllShippingOrders();
      _myOrdersController.getAllCancelledOrders();
      Get.back();
      Utils.showSuccessSnackbar(text: "Order Cancelled");
    }).catchError((e) {
      isLoading.value = false;
      Utils.showErrorSnackbar(
          text: "Failed to cancel order. Please try again later.");
    });
  }
}
