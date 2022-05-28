import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/data/services/auth_service.dart';
import 'package:cycle_store/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final emailController = TextEditingController();

  RxBool isInvalidEmail = false.obs;

  RxBool isLoading = false.obs;

  void sendPasswordResetLink() {
    isInvalidEmail.value = false;

    if (emailController.text.isEmpty || !emailController.text.isEmail) {
      isInvalidEmail.value = true;
    }

    AuthService.sendPasswordResetLink(email: emailController.text)
        .then((value) {
      if (value) {
        Get.toNamed(EMAIL_SENT_ROUTE);
      }
    }).catchError((_) {
      Utils.showErrorSnackbar(text: "Couldn't send reset link");
    });
  }
}
