import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/config/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          height: 20,
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
                  const SizedBox(
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage:
                          NetworkImage("http://picsum.photos/300/300"),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Welcome",
                        style: TextStyle(
                            color: SECONDARY_TEXT_COLOR, fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "John Doe",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w800),
                      ),
                    ],
                  )
                ],
              ),
              IconButton(
                  onPressed: () {},
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
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                InkWell(
                  onTap: () => Get.toNamed(ADDRESS_ROUTE),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFFFF5E5),
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Icon(
                                Icons.place_outlined,
                                color: Color(0xFFFBD790),
                                size: 30,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              "My Address",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFFFEDF8),
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Icon(
                                Icons.local_shipping_outlined,
                                color: Color(0xFFFBB4D0),
                                size: 30,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              "My Orders",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFF5F0FD),
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Icon(
                                Icons.perm_identity_outlined,
                                color: Color(0xFFBEAFE9),
                                size: 30,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              "Profile",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
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
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.headset_mic_outlined,
                        color: SUCCESS_COLOR,
                        size: 36,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Contact Us",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
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
