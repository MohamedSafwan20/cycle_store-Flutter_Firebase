import 'package:cycle_store/data/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  User user = AuthService.getCurrentUser();

  @override
  void onInit() {
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

    super.onInit();
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
