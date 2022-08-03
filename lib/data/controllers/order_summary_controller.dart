import 'package:cycle_store/data/controllers/my_orders_controller.dart';
import 'package:cycle_store/data/services/user_service.dart';
import 'package:cycle_store/ui/widgets/primary_ghost_button.dart';
import 'package:cycle_store/utils/utils.dart';
import 'package:flutter/cupertino.dart';
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

  void showDialog() {
    Get.defaultDialog(
        title: "Confirm",
        titleStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17,
        ),
        titlePadding: const EdgeInsets.only(top: 15, bottom: 10),
        contentPadding: EdgeInsets.zero,
        radius: 5,
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const Text("Are you sure?"),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryGhostButton(
                    width: 50,
                    height: 40,
                    text: "Yes",
                    onPressed: () {
                      Get.back();
                      cancelOrder();
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  PrimaryGhostButton(
                      width: 50,
                      height: 40,
                      text: "No",
                      onPressed: () {
                        Get.back();
                      }),
                ],
              )
            ],
          ),
        ));
  }
}
