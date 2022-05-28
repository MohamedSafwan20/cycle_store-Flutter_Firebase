import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/data/controllers/signup_controller.dart';
import 'package:cycle_store/ui/widgets/loading.dart';
import 'package:cycle_store/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(SignupController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      "assets/images/logo.jpg",
                      width: 180,
                      height: 180,
                    )),
                const Text(
                  "Hello!",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Sign up to get started",
                  style: TextStyle(
                      color: SECONDARY_TEXT_COLOR,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  height: 52,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: SHADOW_COLOR,
                          offset: Offset(0, 0.5),
                          blurRadius: 5),
                      BoxShadow(
                          color: SHADOW_COLOR,
                          offset: Offset(0.5, 0),
                          blurRadius: 5),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    controller: _controller.nameController,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: "Name",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      hintStyle: const TextStyle(color: SECONDARY_TEXT_COLOR),
                    ),
                  ),
                ),
                _controller.isInvalidName.value
                    ? const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Invalid name",
                          style: TextStyle(color: ERROR_COLOR),
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 52,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: SHADOW_COLOR,
                          offset: Offset(0, 0.5),
                          blurRadius: 5),
                      BoxShadow(
                          color: SHADOW_COLOR,
                          offset: Offset(0.5, 0),
                          blurRadius: 5),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _controller.emailController,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: "Email Address",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      hintStyle: const TextStyle(color: SECONDARY_TEXT_COLOR),
                    ),
                  ),
                ),
                _controller.isInvalidEmail.value
                    ? const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Invalid Email",
                          style: TextStyle(color: ERROR_COLOR),
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 52,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: SHADOW_COLOR,
                          offset: Offset(0, 0.5),
                          blurRadius: 5),
                      BoxShadow(
                          color: SHADOW_COLOR,
                          offset: Offset(0.5, 0),
                          blurRadius: 5),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    obscureText: true,
                    controller: _controller.passwordController,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: "Password",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      hintStyle: const TextStyle(color: SECONDARY_TEXT_COLOR),
                    ),
                  ),
                ),
                _controller.isInvalidPassword.value
                    ? const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Password should be at least 8 character long.\nMust contain numbers and alphabets",
                          style: TextStyle(color: ERROR_COLOR),
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 52,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: SHADOW_COLOR,
                          offset: Offset(0, 0.5),
                          blurRadius: 5),
                      BoxShadow(
                          color: SHADOW_COLOR,
                          offset: Offset(0.5, 0),
                          blurRadius: 5),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    obscureText: true,
                    controller: _controller.confirmPasswordController,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: "Confirm Password",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      hintStyle: const TextStyle(color: SECONDARY_TEXT_COLOR),
                    ),
                  ),
                ),
                _controller.isInvalidConfirmPassword.value
                    ? const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Passwords didn't match",
                          style: TextStyle(color: ERROR_COLOR),
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 40,
                ),
                _controller.isLoading.value
                    ? const Loading()
                    : PrimaryButton(
                        text: "Signup",
                        onPressed: () {
                          _controller.signup();
                        },
                        width: double.infinity,
                        height: 50,
                        textStyle: const TextStyle(fontSize: 18),
                        borderRadius: 8,
                      ),
                const SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      const Text(
                        "Already Have An Account?",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                          onPressed: () => Get.toNamed(LOGIN_ROUTE),
                          child: const Text(
                            "Sign in",
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
