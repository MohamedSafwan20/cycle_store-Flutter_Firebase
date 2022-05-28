import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/typography.dart';
import 'package:cycle_store/data/controllers/reset_password_controller.dart';
import 'package:cycle_store/ui/widgets/custom_app_bar.dart';
import 'package:cycle_store/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(ResetPasswordController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Reset Password",
                        style: HEADING_1,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Enter the email associated with your account and we’ll send an email with instructions to reset your password",
                        style: TextStyle(
                            color: SECONDARY_TEXT_COLOR, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Obx(() {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 2.0),
                              child: Text(
                                "Email Address",
                                style: TextStyle(color: SECONDARY_TEXT_COLOR),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                controller: _controller.emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  isDense: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: SECONDARY_TEXT_COLOR)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: SECONDARY_TEXT_COLOR)),
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
                          ],
                        );
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      PrimaryButton(
                          text: "Send Reset Link",
                          onPressed: () {
                            _controller.sendPasswordResetLink();
                          })
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
