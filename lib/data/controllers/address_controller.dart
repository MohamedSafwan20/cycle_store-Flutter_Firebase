import 'package:cycle_store/data/models/address_model.dart';
import 'package:cycle_store/data/services/user_service.dart';
import 'package:cycle_store/utils/utils.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  RxList addresses = [].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getAllAddresses();

    super.onInit();
  }

  void getAllAddresses() {
    isLoading.value = true;
    UserService.getAllAddresses().then((res) {
      if (!res["status"]) {
        throw Exception("Failed to get addresses");
      }

      addresses.value = res["data"];
      isLoading.value = false;
    }).catchError((e) {
      isLoading.value = false;
    });
  }

  void makeAddressDefault(Address address) {
    UserService.makeAddressDefault(address).then((res) {
      if (!res["status"]) {
        throw Exception("Failed to change default address");
      }

      addresses.value = res["data"];
      Utils.showSuccessSnackbar(text: "Default address changed");
    }).catchError((e) {
      Utils.showErrorSnackbar(text: e.message);
    });
  }
}
