import 'dart:developer';

import 'package:cycle_store/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static Future<User?> signup(
      {required String email, required String password}) async {
    try {
      UserCredential res = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return res.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        Utils.showErrorSnackbar(text: "Email already exists");
      }
    }

    return null;
  }

  static Future<Map> login(
      {required String email, required String password}) async {
    try {
      UserCredential res = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return {"status": true, "data": res.user};
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        Utils.showErrorSnackbar(text: "User doesn't exist");
      }

      if (e.code == "wrong-password") {
        Utils.showErrorSnackbar(text: "Wrong password");
      }

      return {"status": false, "data": {}};
    }
  }

  static User getCurrentUser() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception();
    }

    return user;
  }

  static Future<bool> sendVerificationEmail() async {
    try {
      User user = AuthService.getCurrentUser();

      await user.sendEmailVerification();

      return true;
    } catch (_) {
      return false;
    }
  }

  static Future<bool> sendPasswordResetLink({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      return true;
    } on FirebaseAuthException catch (e) {
      log(e.code.toString());
      if (e.code == "user-not-found") {
        Utils.showErrorSnackbar(text: "Account doesn't exist");
      }

      return false;
    }
  }
}