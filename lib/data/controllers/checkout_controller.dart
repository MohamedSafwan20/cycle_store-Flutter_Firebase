import 'package:cycle_store/data/models/address_model.dart';
import 'package:cycle_store/data/models/product_model.dart';
import 'package:cycle_store/data/services/user_service.dart';
import 'package:cycle_store/utils/utils.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  List? products = Get.arguments["products"];
  List? quantities = Get.arguments["quantities"];
  Product? product = Get.arguments["product"];

  RxList<Address> defaultAddress = <Address>[].obs;
  RxDouble price = 0.0.obs;

  RxBool hasNoDefaultAddress = false.obs;
  RxBool isAddressLoading = false.obs;

  @override
  void onInit() {
    // Products from cart
    if (products != null) {
      for (int i = 0; i < products!.length; i++) {
        price.value =
            price.value + (products![i]["product"].price * quantities![i]);
      }
      // Product from product details page
    } else {
      price.value = product!.price;
    }

    getDefaultAddress();

    super.onInit();
  }

  void getDefaultAddress() {
    hasNoDefaultAddress.value = false;
    isAddressLoading.value = true;

    UserService.getDefaultAddress().then((res) {
      isAddressLoading.value = false;

      if (!res["status"]) {
        throw Exception();
      }

      if (res["data"] == null) {
        hasNoDefaultAddress.value = true;
      } else {
        defaultAddress.value = [res["data"]];
      }
    }).catchError((e) {
      isAddressLoading.value = false;

      Get.back();
      Utils.showErrorSnackbar(
          text: "Failed to checkout. Please try again later.");
    });
  }
}
