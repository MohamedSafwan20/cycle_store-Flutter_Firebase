import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/config/typography.dart';
import 'package:cycle_store/ui/widgets/custom_app_bar.dart';
import 'package:cycle_store/ui/widgets/primary_button.dart';
import 'package:cycle_store/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailSentPage extends StatelessWidget {
  const EmailSentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset(
                            "assets/images/email_sent.png",
                            width: 220,
                            height: 220,
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Check Your Email",
                        style: HEADING_1,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                          width: 320,
                          child: Text(
                            "We have sent a password reset mail to your email",
                            style: TextStyle(
                                color: SECONDARY_TEXT_COLOR, fontSize: 16),
                            textAlign: TextAlign.center,
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      PrimaryButton(
                        text: "Open Email App",
                        onPressed: () => Utils.openMailApp(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () => Get.toNamed(LOGIN_ROUTE),
                          child: const Text(
                            "Go to login",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w700),
                          )),
                      const SizedBox(height: 40),
                      const SizedBox(
                          width: 280,
                          child: Text(
                            "Did not receive the email? check your spam folder",
                            style: TextStyle(
                                color: SECONDARY_TEXT_COLOR, fontSize: 14),
                            textAlign: TextAlign.center,
                          )),
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
