import 'package:cycle_store/data/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddEditAddressController extends GetxController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final pincodeController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final localityController = TextEditingController();
  final landmarkController = TextEditingController();

  void onPincodeChange(String pincode) {
    if (pincode.length == 6) {
      ApiService.getLocationFromPincode(pincode).then((res) {
        if (res["status"]) {
          cityController.text = res["city"];
          stateController.text = res["state"];
        } else {
          cityController.clear();
          stateController.clear();
        }
      });
    }
  }
}
