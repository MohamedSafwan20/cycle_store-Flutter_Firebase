import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/ui/widgets/custom_app_bar.dart';
import 'package:cycle_store/utils/utils.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const phone = "0123456789";
    const email = "example@gmail.com";

    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: CustomAppBar(
                  title: "Contact Us",
                  textStyle: TextStyle(color: Colors.white),
                )),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      "Get in touch!",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width - 60,
                        child: const Text(
                          "Contact us for help or complaint regarding your product.",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        )),
                    const SizedBox(
                      height: 60,
                    ),
                    InkWell(
                      onTap: () {
                        Utils.callNumber(phone: phone);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 35.0, horizontal: 10),
                        width: MediaQuery.of(context).size.width - 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: PRIMARY_TEXT_COLOR)),
                        child: Column(
                          children: const [
                            Icon(
                              Icons.call_outlined,
                              color: PRIMARY_TEXT_COLOR,
                              size: 36,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "+91 $phone",
                              style: TextStyle(
                                  color: PRIMARY_TEXT_COLOR,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 19),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    InkWell(
                      onTap: () {
                        Utils.sentMailTo(email: email);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 35.0, horizontal: 10),
                        width: MediaQuery.of(context).size.width - 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: PRIMARY_TEXT_COLOR)),
                        child: Column(
                          children: const [
                            Icon(
                              Icons.email_outlined,
                              color: PRIMARY_TEXT_COLOR,
                              size: 36,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              email,
                              style: TextStyle(
                                  color: PRIMARY_TEXT_COLOR,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 19),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
