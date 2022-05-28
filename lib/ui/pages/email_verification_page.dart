import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/config/typography.dart';
import 'package:cycle_store/data/controllers/email_verification_controller.dart';
import 'package:cycle_store/ui/widgets/custom_app_bar.dart';
import 'package:cycle_store/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(EmailVerificationController());

    _controller.sendVerificationEmail();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(
                title: "Verification",
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Obx(() {
                    return Column(
                      children: [
                        Align(
                            alignment: Alignment.topCenter,
                            child: Image.asset(
                              "assets/images/email_verification.png",
                              width: 240,
                              height: 240,
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Verify Your Email",
                          style: HEADING_1,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                            width: 320,
                            child: Text(
                              "Please verify your email by clicking the link we sent to your email",
                              style: TextStyle(
                                  color: SECONDARY_TEXT_COLOR, fontSize: 16),
                              textAlign: TextAlign.center,
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 100,
                          child: Text(
                            _controller.email.value,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        PrimaryButton(
                          text: "Open Email App",
                          onPressed: () {
                            _controller.openMailApp();
                          },
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
                            ))
                      ],
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
