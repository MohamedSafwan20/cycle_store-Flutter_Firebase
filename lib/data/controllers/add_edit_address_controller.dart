import 'package:cycle_store/data/controllers/address_controller.dart';
import 'package:cycle_store/data/models/address_model.dart';
import 'package:cycle_store/data/services/api_service.dart';
import 'package:cycle_store/data/services/user_service.dart';
import 'package:cycle_store/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddEditAddressController extends GetxController {
  final _addressController = Get.find<AddressController>();
  final passedAddress = Get.arguments?["address"] as Address?;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final pincodeController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final localityController = TextEditingController();
  final landmarkController = TextEditingController();

  RxBool isInvalidName = false.obs;
  RxBool isInvalidPhone = false.obs;
  RxBool isInvalidPincode = false.obs;
  RxBool isInvalidCity = false.obs;
  RxBool isInvalidState = false.obs;
  RxBool isInvalidLocality = false.obs;

  RxBool isDefaultAddress = false.obs;
  RxBool isLoading = false.obs;

  AddEditAddressController() {
    if (passedAddress != null) {
      nameController.text = passedAddress!.name;
      phoneController.text = passedAddress!.phone;
      pincodeController.text = passedAddress!.pincode;
      cityController.text = passedAddress!.city;
      stateController.text = passedAddress!.state;
      localityController.text = passedAddress!.locality;
      landmarkController.text = passedAddress!.landmark;
      isDefaultAddress.value = passedAddress!.isDefault!;
    }
  }

  void onPincodeChange(String pincode) {
    isInvalidPincode.value = false;

    if (pincode.length == 6) {
      ApiService.getLocationFromPincode(pincode).then((res) {
        if (res["status"]) {
          cityController.text = res["city"];
          stateController.text = res["state"];
        } else {
          isInvalidPincode.value = true;
          cityController.clear();
          stateController.clear();
        }
      });
    }
  }

  void addAddress() {
    isInvalidName.value = false;
    isInvalidPhone.value = false;
    isInvalidCity.value = false;
    isInvalidState.value = false;
    isInvalidLocality.value = false;

    if (nameController.text == "" || nameController.text.length < 3) {
      isInvalidName.value = true;
    }
    if (phoneController.text == "" || phoneController.text.length != 10) {
      isInvalidPhone.value = true;
    }
    if (pincodeController.text == "" || pincodeController.text.length != 6) {
      isInvalidPincode.value = true;
    }
    if (cityController.text == "" || cityController.text.length < 3) {
      isInvalidCity.value = true;
    }
    if (stateController.text == "" || stateController.text.length < 3) {
      isInvalidState.value = true;
    }
    if (localityController.text == "" || localityController.text.length < 3) {
      isInvalidLocality.value = true;
    }

    if (isInvalidName.value ||
        isInvalidPhone.value ||
        isInvalidPincode.value ||
        isInvalidCity.value ||
        isInvalidState.value ||
        isInvalidLocality.value) {
      return;
    }

    isLoading.value = true;

    if (passedAddress != null) {
      UserService.updateAddress(
          Address.toAddress({
            "name": nameController.text,
            "phone": phoneController.text,
            "pincode": pincodeController.text,
            "city": cityController.text,
            "state": stateController.text,
            "locality": localityController.text,
            "landmark": landmarkController.text,
          }),
          isDefault: isDefaultAddress.value,
          oldAddress: {
            "name": passedAddress?.name,
            "phone": passedAddress?.phone,
            "pincode": passedAddress?.pincode,
            "city": passedAddress?.city,
            "state": passedAddress?.state,
            "locality": passedAddress?.locality,
            "landmark": passedAddress?.landmark,
          }).then((res) {
        isLoading.value = false;

        if (!res["status"]) {
          throw Exception("Failed to update address");
        }

        _addressController.getAllAddresses();
        Get.back();
        Utils.showSuccessSnackbar(text: "Address Updated");
      }).catchError((e) {
        isLoading.value = false;
        Utils.showErrorSnackbar(text: e.message);
      });

      return;
    }

    UserService.addAddress(
            Address.toAddress({
              "name": nameController.text,
              "phone": phoneController.text,
              "pincode": pincodeController.text,
              "city": cityController.text,
              "state": stateController.text,
              "locality": localityController.text,
              "landmark": landmarkController.text,
            }),
            isDefault: isDefaultAddress.value)
        .then((res) {
      isLoading.value = false;

      if (!res["status"]) {
        throw Exception("Failed to add address");
      }

      _addressController.getAllAddresses();
      Get.back();
    }).catchError((e) {
      isLoading.value = false;
      Utils.showErrorSnackbar(text: e.message);
    });
  }

  void onDefaultAddressChange() {
    isDefaultAddress.value = !isDefaultAddress.value;
  }
}
