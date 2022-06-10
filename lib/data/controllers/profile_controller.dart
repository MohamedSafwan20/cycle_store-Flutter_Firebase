import 'package:cycle_store/data/services/auth_service.dart';
import 'package:cycle_store/data/services/user_service.dart';
import 'package:cycle_store/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool isInvalidFirstName = false.obs;
  RxBool isInvalidLastName = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getUserDetails();

    super.onInit();
  }

  void getUserDetails() {
    User user = AuthService.getCurrentUser();

    List usernameList = user.displayName!.split(" ");

    if (usernameList.first == usernameList.last) {
      firstNameController.text = usernameList[0];
      lastNameController.text = "";
    } else {
      firstNameController.text = usernameList[0];
      lastNameController.text = usernameList[1];
    }

    emailController.text = user.email!;
    passwordController.text = "password1";
  }

  void updateProfile() {
    isInvalidFirstName.value = false;
    isInvalidLastName.value = false;

    if (firstNameController.text.isEmpty ||
        firstNameController.text.length < 3) {
      isInvalidFirstName.value = true;
    }

    if (lastNameController.text.isEmpty || lastNameController.text.length < 3) {
      isInvalidLastName.value = true;
    }

    if (isInvalidLastName.value || isInvalidFirstName.value) {
      return;
    }

    isLoading.value = true;

    UserService.updateDisplayName(
            "${firstNameController.text} ${lastNameController.text}")
        .then((res) {
      isLoading.value = false;

      if (!res["status"]) {
        throw Exception("Failed to update name");
      }

      getUserDetails();
      Utils.showSuccessSnackbar(text: "Name Updated");
    }).catchError((e) {
      isLoading.value = false;
      Utils.showErrorSnackbar(text: e.message);
    });
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
}
