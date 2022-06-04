import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/data/services/auth_service.dart';
import 'package:cycle_store/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RxBool isInvalidName = false.obs;
  RxBool isInvalidEmail = false.obs;
  RxBool isInvalidPassword = false.obs;
  RxBool isInvalidConfirmPassword = false.obs;

  RxBool isLoading = false.obs;

  void signup() async {
    isInvalidName.value = false;
    isInvalidEmail.value = false;
    isInvalidPassword.value = false;
    isInvalidConfirmPassword.value = false;

    if (nameController.text.isEmpty || nameController.text.length < 3) {
      isInvalidName.value = true;
    }

    if (emailController.text.isEmpty || !emailController.text.isEmail) {
      isInvalidEmail.value = true;
    }

    if (passwordController.text.isEmpty ||
        passwordController.text.length < 8 ||
        passwordController.text.isAlphabetOnly ||
        passwordController.text.isNumericOnly) {
      isInvalidPassword.value = true;
    }

    if (confirmPasswordController.text.isEmpty ||
        confirmPasswordController.text != passwordController.text) {
      isInvalidConfirmPassword.value = true;
    }

    if (isInvalidName.value ||
        isInvalidEmail.value ||
        isInvalidPassword.value ||
        isInvalidConfirmPassword.value) return;

    isLoading.value = true;

    AuthService.signup(
            email: emailController.text, password: passwordController.text)
        .then((value) async {
      // Utils.showSuccessSnackbar(text: "Account created");
      isLoading.value = false;

      if (value != null) {
        await value.updateDisplayName(nameController.text);

        Get.toNamed(EMAIL_VERIFICATION_ROUTE,
            arguments: {"email": value.email});
      }
    }).catchError((e) {
      Utils.showErrorSnackbar(text: "Couldn't signup");
      isLoading.value = false;
    });
  }
}
