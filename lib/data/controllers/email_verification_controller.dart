import 'dart:developer';

import 'package:cycle_store/data/services/auth_service.dart';
import 'package:cycle_store/utils/utils.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailVerificationController extends GetxController {
  String argsEmail = Get.arguments["email"];
  RxString email = "".obs;

  RxBool isLoading = false.obs;

  EmailVerificationController() {
    email.value = argsEmail;
  }

  void openMailApp() async {
    try {
      await launchUrl(Uri.parse("mailto: "));
    } catch (e) {
      log(e.toString());
      Utils.showErrorSnackbar(text: "Couldn't open mail app");
    }
  }

  void sendVerificationEmail() {
    isLoading.value = true;

    AuthService.sendVerificationEmail().then((value) {
      if (!value) {
        throw Exception();
      }

      isLoading.value = false;
    }).catchError((_) {
      email.value = "Something went wrong. Please login again";
      isLoading.value = false;
    });
  }
}
