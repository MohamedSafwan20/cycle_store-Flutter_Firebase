import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
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
                  onChanged: (value) {},
                  decoration: InputDecoration(
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
              const SizedBox(
                height: 20,
              ),
              Container(
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
                  onChanged: (value) {},
                  decoration: InputDecoration(
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
              const SizedBox(
                height: 20,
              ),
              Container(
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
                  onChanged: (value) {},
                  decoration: InputDecoration(
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
              const SizedBox(
                height: 20,
              ),
              Container(
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
                  onChanged: (value) {},
                  decoration: InputDecoration(
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
              const SizedBox(
                height: 40,
              ),
              PrimaryButton(
                text: "Signup",
                onPressed: () {},
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
                        onPressed: () {},
                        child: const Text(
                          "Sign in",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
