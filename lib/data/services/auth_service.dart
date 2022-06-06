import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService {
  static Future<User?> signup({required String email, required String password}) async {
    try {
      UserCredential res = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await FirebaseFirestore.instance
          .collection("users")
          .doc(res.user?.uid)
          .set({
        "cart": [],
        "orders": [],
      });

      return res.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        Utils.showErrorSnackbar(text: "Email already exists");
      }
    }

    return null;
  }

  static Future<Map> login({required String email, required String password}) async {
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
      throw Exception("User not logged in");
    }

    return user;
  }

  static Future<bool> sendVerificationEmail() async {
    try {
      User user = AuthService.getCurrentUser();

      await user.sendEmailVerification();

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'too-many-requests') {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> sendPasswordResetLink({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        Utils.showErrorSnackbar(text: "Account doesn't exist");
      }

      return false;
    }
  }

  static logout() async {
    await FirebaseAuth.instance.signOut();

    Get.offAllNamed(LOGIN_ROUTE);
  }
}
