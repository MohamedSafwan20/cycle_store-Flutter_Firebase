import 'package:cycle_store/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static void showErrorSnackbar({required String text}) {
    Get.rawSnackbar(
      messageText: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
      ),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ERROR_COLOR,
    );
  }

  static void showSuccessSnackbar({required String text}) {
    Get.rawSnackbar(
      messageText: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
      ),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: SUCCESS_COLOR,
    );
  }
}
