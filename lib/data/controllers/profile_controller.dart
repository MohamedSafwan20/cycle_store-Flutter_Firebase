import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/data/services/auth_service.dart';
import 'package:cycle_store/data/services/user_service.dart';
import 'package:cycle_store/ui/widgets/primary_button.dart';
import 'package:cycle_store/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/widgets/loading.dart';

class ProfileController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginPasswordController = TextEditingController();
  User user = AuthService.getCurrentUser();

  RxBool isInvalidFirstName = false.obs;
  RxBool isInvalidLastName = false.obs;
  RxBool isInvalidLoginPassword = false.obs;
  RxBool isLoading = false.obs;
  RxBool isModalBottomSheetConfirmLoading = false.obs;
  RxBool isEmailChanged = false.obs;

  @override
  void onInit() {
    getUserDetails();

    super.onInit();
  }

  void getUserDetails() {
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

  void onEmailChange(email) {
    if (email != user.email!) {
      isEmailChanged.value = true;
      return;
    }

    isEmailChanged.value = false;
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

  void updateEmail() {
    UserService.updateEmail(emailController.text).then((res) {
      isModalBottomSheetConfirmLoading.value = false;

      if (res["status"]) {
        Get.toNamed(EMAIL_VERIFICATION_ROUTE,
            arguments: {"email": AuthService.getCurrentUser().email});
      }
    });
  }

  void handlePasswordBottomSheetConfirm() {
    isInvalidLoginPassword.value = false;

    if (loginPasswordController.text.isEmpty ||
        loginPasswordController.text.length < 8 ||
        loginPasswordController.text.isAlphabetOnly ||
        loginPasswordController.text.isNumericOnly) {
      isInvalidLoginPassword.value = true;
      return;
    }

    isModalBottomSheetConfirmLoading.value = true;

    AuthService.login(
            email: emailController.text, password: loginPasswordController.text)
        .then((res) {
      if (!res["status"]) {
        throw Exception();
      }

      updateEmail();
    }).catchError((e) {
      isModalBottomSheetConfirmLoading.value = false;
      isInvalidLoginPassword.value = true;
    });
  }

  void showPasswordBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: Get.context!,
        isScrollControlled: true,
        builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(() {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            obscureText: true,
                            controller: loginPasswordController,
                            decoration: const InputDecoration(
                                label: Text("Enter Your Password")),
                            autofocus: true,
                          ),
                          isInvalidLoginPassword.value
                              ? const Padding(
                                  padding: EdgeInsets.only(top: 5, left: 5),
                                  child: Text(
                                    "Wrong Password",
                                    style: TextStyle(color: ERROR_COLOR),
                                  ),
                                )
                              : const SizedBox(),
                          const SizedBox(
                            height: 20,
                          ),
                          isModalBottomSheetConfirmLoading.value
                              ? const Loading()
                              : PrimaryButton(
                                  text: "Confirm",
                                  onPressed: () {
                                    handlePasswordBottomSheetConfirm();
                                  },
                                  width: 200,
                                )
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ));
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
