import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/data/services/auth_service.dart';
import 'package:cycle_store/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool isInvalidEmail = false.obs;
  RxBool isInvalidPassword = false.obs;

  RxBool isLoading = false.obs;

  void login() async {
    isInvalidEmail.value = false;
    isInvalidPassword.value = false;

    if (emailController.text.isEmpty || !emailController.text.isEmail) {
      isInvalidEmail.value = true;
    }

    if (passwordController.text.isEmpty ||
        passwordController.text.length < 8 ||
        passwordController.text.isAlphabetOnly ||
        passwordController.text.isNumericOnly) {
      isInvalidPassword.value = true;
    }

    if (isInvalidEmail.value || isInvalidPassword.value) return;

    isLoading.value = true;

    AuthService.login(
            email: emailController.text, password: passwordController.text)
        .then((res) {
      if (res["status"]) {
        Get.offAllNamed(HOME_ROUTE);
      }

      isLoading.value = false;
    }).catchError((_) {
      Utils.showErrorSnackbar(text: "Couldn't login");
      isLoading.value = false;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
}
