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

  static Future<User?> login(
      {required String email, required String password}) async {
    try {
      UserCredential res = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return res.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        Utils.showErrorSnackbar(text: "User doesn't exist");
      }

      if (e.code == "wrong-password") {
        Utils.showErrorSnackbar(text: "Wrong password");
      }
    }

    return null;
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
}
