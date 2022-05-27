import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/ui/widgets/custom_app_bar.dart';
import 'package:cycle_store/ui/widgets/primary_button.dart';
import 'package:cycle_store/ui/widgets/secondary_icon_button.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          const SizedBox(
                            width: 110,
                            height: 110,
                            child: CircleAvatar(
                              radius: 30.0,
                              backgroundImage:
                                  NetworkImage("http://picsum.photos/300/300"),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 3,
                              child: Container(
                                alignment: Alignment.center,
                                child: SecondaryIconButton(
                                  onPressed: () {},
                                  icon: Icons.edit,
                                  size: 20,
                                  borderRadius: 50,
                                  width: 35,
                                  height: 35,
                                ),
                              ))
                        ],
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
                                    style:
                                        TextStyle(color: SECONDARY_TEXT_COLOR),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 50,
                                  child: TextField(
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
                                )
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
                                    style:
                                        TextStyle(color: SECONDARY_TEXT_COLOR),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 50,
                                  child: TextField(
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
                                )
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
                                    style:
                                        TextStyle(color: SECONDARY_TEXT_COLOR),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 50,
                                  child: TextField(
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
                            onPressed: () {},
                          )
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
                                    style:
                                        TextStyle(color: SECONDARY_TEXT_COLOR),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 50,
                                  child: TextField(
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
                                    ),
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
                            onPressed: () {},
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: PrimaryButton(
                            text: "Save",
                            onPressed: () {},
                            height: 48,
                            width: 180,
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
