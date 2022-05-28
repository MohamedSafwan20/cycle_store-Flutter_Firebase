import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/data/controllers/login_controller.dart';
import 'package:cycle_store/ui/widgets/loading.dart';
import 'package:cycle_store/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(LoginController());

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
                  "Welcome back!",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
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
                    controller: _controller.passwordController,
                    obscureText: true,
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
                          "Invalid Password",
                          style: TextStyle(color: ERROR_COLOR),
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 4,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () => Get.toNamed(RESET_PASSWORD_ROUTE),
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ))),
                const SizedBox(
                  height: 30,
                ),
                _controller.isLoading.value
                    ? const Loading()
                    : PrimaryButton(
                        text: "Sign in",
                        onPressed: () {
                          _controller.login();
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
                        "Don’t Have An Account?",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                          onPressed: () => Get.toNamed(SIGNUP_ROUTE),
                          child: const Text(
                            "Sign up",
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
