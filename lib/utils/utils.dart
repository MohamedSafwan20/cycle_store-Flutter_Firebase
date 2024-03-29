import 'package:cycle_store/config/colors.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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

  static void openMailApp({String email = ""}) async {
    try {
      await LaunchApp.openApp(
          androidPackageName: 'com.google.android.gm', openStore: true);
    } catch (e) {
      Utils.showErrorSnackbar(text: "Couldn't open mail app");
    }
  }

  static void sentMailTo({String email = ""}) async {
    try {
      await launchUrl(Uri.parse("mailto: $email"));
    } catch (e) {
      Utils.showErrorSnackbar(text: "Couldn't open mail app");
    }
  }

  static void callNumber({String phone = ""}) async {
    try {
      await launchUrl(Uri.parse("tel://$phone"));
    } catch (_) {
      Utils.showErrorSnackbar(text: "Couldn't open phone app");
    }
  }

  static Future<String> getImageFromStorage({required String path}) async {
    final ref = FirebaseStorage.instance.ref().child(path);

    String url = await ref.getDownloadURL();
    return url;
  }

  static String getAvatarName(String name) {
    String avatarName = "";

    final nameList = name.split(" ");
    for (String name in nameList) {
      if (name.isEmpty) {
        break;
      }
      avatarName += name[0].toUpperCase();
    }

    return avatarName;
  }
}
