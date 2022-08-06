import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/data/controllers/profile_controller.dart';
import 'package:cycle_store/data/services/auth_service.dart';
import 'package:cycle_store/ui/widgets/custom_app_bar.dart';
import 'package:cycle_store/ui/widgets/loading.dart';
import 'package:cycle_store/ui/widgets/name_avatar.dart';
import 'package:cycle_store/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: CustomAppBar(
                title: "Profile",
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Obx(() {
                    return Column(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: NameAvatar(
                            name: AuthService.getCurrentUser().displayName!,
                            fontSize: 35,
                          ),
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 2.0),
                                    child: Text(
                                      "First Name",
                                      style: TextStyle(
                                          color: SECONDARY_TEXT_COLOR),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: TextField(
                                      controller:
                                          _controller.firstNameController,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: SECONDARY_TEXT_COLOR)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: SECONDARY_TEXT_COLOR)),
                                      ),
                                    ),
                                  ),
                                  _controller.isInvalidFirstName.value
                                      ? const Padding(
                                          padding:
                                              EdgeInsets.only(top: 5, left: 5),
                                          child: Text(
                                            "Invalid First Name",
                                            style:
                                                TextStyle(color: ERROR_COLOR),
                                          ),
                                        )
                                      : const SizedBox(),
                                  _controller.isInvalidLastName.value
                                      ? const Padding(
                                          padding:
                                              EdgeInsets.only(top: 5, left: 5),
                                          child: Text(
                                            "",
                                            style:
                                                TextStyle(color: ERROR_COLOR),
                                          ),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 2.0),
                                    child: Text(
                                      "Last Name",
                                      style: TextStyle(
                                          color: SECONDARY_TEXT_COLOR),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: TextField(
                                      controller:
                                          _controller.lastNameController,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: SECONDARY_TEXT_COLOR)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: SECONDARY_TEXT_COLOR)),
                                      ),
                                    ),
                                  ),
                                  _controller.isInvalidLastName.value
                                      ? const Padding(
                                          padding:
                                              EdgeInsets.only(top: 5, left: 5),
                                          child: Text(
                                            "Invalid Last Name",
                                            style:
                                                TextStyle(color: ERROR_COLOR),
                                          ),
                                        )
                                      : const SizedBox(),
                                  _controller.isInvalidFirstName.value
                                      ? const Padding(
                                          padding:
                                              EdgeInsets.only(top: 5, left: 5),
                                          child: Text(
                                            "",
                                            style:
                                                TextStyle(color: ERROR_COLOR),
                                          ),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 2.0),
                                    child: Text(
                                      "Email",
                                      style: TextStyle(
                                          color: SECONDARY_TEXT_COLOR),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: TextField(
                                      onChanged: (email) {
                                        _controller.onEmailChange(email);
                                      },
                                      controller: _controller.emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: SECONDARY_TEXT_COLOR)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: SECONDARY_TEXT_COLOR)),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: SECONDARY_TEXT_COLOR)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            _controller.isEmailChanged.value
                                ? IconButton(
                                    icon: const Icon(
                                      Icons.check_outlined,
                                      color: PRIMARY_COLOR,
                                    ),
                                    onPressed: () {
                                      _controller.showPasswordBottomSheet();
                                    },
                                  )
                                : const SizedBox()
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 2.0),
                                    child: Text(
                                      "Password",
                                      style: TextStyle(
                                          color: SECONDARY_TEXT_COLOR),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: TextField(
                                      enabled: false,
                                      controller:
                                          _controller.passwordController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          isDense: true,
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: SECONDARY_TEXT_COLOR)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: SECONDARY_TEXT_COLOR)),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color:
                                                      SECONDARY_TEXT_COLOR))),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: PRIMARY_COLOR,
                              ),
                              onPressed: () {
                                Get.toNamed(RESET_PASSWORD_ROUTE);
                              },
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: _controller.isLoading.value
                                ? const Loading()
                                : PrimaryButton(
                                    text: "Save",
                                    onPressed: () {
                                      _controller.updateProfile();
                                    },
                                    height: 48,
                                    width: 180,
                                  )),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
