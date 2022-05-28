import 'package:cycle_store/data/services/auth_service.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController {
  String argsEmail = Get.arguments["email"];
  RxString email = "".obs;

  RxBool isLoading = false.obs;

  EmailVerificationController() {
    email.value = argsEmail;
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
