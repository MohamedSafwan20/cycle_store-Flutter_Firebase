import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/data/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 560), () {
      try {
        AuthService.getCurrentUser();

        Get.offAllNamed(HOME_ROUTE);
      } catch (e) {
        Get.offAllNamed(LOGIN_ROUTE);
      }
    });

    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: Center(
          child: Image.asset(
        "assets/images/splash.png",
        width: 150,
        height: 150,
      )),
    );
  }
}
