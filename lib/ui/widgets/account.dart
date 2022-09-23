import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/config/typography.dart';
import 'package:cycle_store/data/services/auth_service.dart';
import 'package:cycle_store/ui/widgets/name_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userName = AuthService.getCurrentUser().displayName as String;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "Settings",
            style: HEADING_1,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: SECONDARY_TEXT_COLOR,
          thickness: 0.2,
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: NameAvatar(
                      name: userName,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Welcome",
                        style: TextStyle(
                            color: SECONDARY_TEXT_COLOR, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        userName.capitalize!,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                    ],
                  )
                ],
              ),
              IconButton(
                  onPressed: () => AuthService.logout(),
                  icon: const Icon(
                    Icons.logout_outlined,
                    size: 26,
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: SECONDARY_TEXT_COLOR,
          thickness: 0.2,
          height: 0.2,
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                InkWell(
                  onTap: () => Get.toNamed(ADDRESS_ROUTE),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 15, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFFFF5E5),
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Icon(
                                Icons.place_outlined,
                                color: Color(0xFFFBD790),
                                size: 25,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              "My Address",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        const Icon(
                          Icons.chevron_right_outlined,
                          size: 26,
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Get.toNamed(MY_ORDERS_ROUTE),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFFFEDF8),
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Icon(
                                Icons.local_shipping_outlined,
                                color: Color(0xFFFBB4D0),
                                size: 25,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              "My Orders",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        const Icon(
                          Icons.chevron_right_outlined,
                          size: 26,
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Get.toNamed(PROFILE_ROUTE),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFF5F0FD),
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Icon(
                                Icons.perm_identity_outlined,
                                color: Color(0xFFBEAFE9),
                                size: 25,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              "Profile",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        const Icon(
                          Icons.chevron_right_outlined,
                          size: 26,
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Get.toNamed(LEGAL_ROUTE),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFF0FDF7),
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Icon(
                                Icons.article_outlined,
                                color: Color(0xFFAFE9DB),
                                size: 25,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              "Legal",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        const Icon(
                          Icons.chevron_right_outlined,
                          size: 26,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Material(
          color: SUCCESS_TEXT_COLOR,
          child: InkWell(
            onTap: () => Get.toNamed(CONTACT_ROUTE),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.headset_mic_outlined,
                        color: SUCCESS_COLOR,
                        size: 30,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Need help? Contact Us",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: SECONDARY_TEXT_COLOR),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.keyboard_double_arrow_right_outlined,
                    color: SUCCESS_COLOR,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
