import 'dart:developer';

import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

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
              const CustomAppBar(
                title: "Addresses",
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(onPressed: () {}, child: const Text("+ Add address")),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          log("main");
                        },
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              color: BG_COLOR,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                    color: SHADOW_COLOR,
                                    offset: Offset(0, 1),
                                    blurRadius: 6),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 20.0, left: 20, bottom: 20, top: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Flexible(
                                        child: Text(
                                      "John Doe",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800),
                                    )),
                                    Icon(
                                      Icons.download_done_outlined,
                                      color: SUCCESS_COLOR,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Street 1305, Au, kerala\nStreet 1305, Au, kerala\nStreet 1305, Au, kerala',
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: const [
                                    Text("Phone:  "),
                                    Flexible(
                                        child: Text(
                                      "0123456789",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            log("edit");
                                          },
                                          child: const Text(
                                            "Edit",
                                            style: TextStyle(
                                              color: PRIMARY_COLOR,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )),
                                      InkWell(
                                          onTap: () {
                                            log("delete");
                                          },
                                          child: const Text(
                                            "Delete",
                                            style: TextStyle(
                                              color: ERROR_COLOR,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {},
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              color: BG_COLOR,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                    color: SHADOW_COLOR,
                                    offset: Offset(0, 1),
                                    blurRadius: 6),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 20.0, left: 20, bottom: 20, top: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Flexible(
                                        child: Text(
                                      "John Doe",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800),
                                    )),
                                    SizedBox()
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Street 1305, Au, kerala\nStreet 1305, Au, kerala\nStreet 1305, Au, kerala',
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: const [
                                    Text("Phone:  "),
                                    Flexible(
                                        child: Text(
                                      "0123456789",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                          onTap: () {},
                                          child: const Text(
                                            "Edit",
                                            style: TextStyle(
                                              color: PRIMARY_COLOR,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )),
                                      InkWell(
                                          onTap: () {},
                                          child: const Text(
                                            "Delete",
                                            style: TextStyle(
                                              color: ERROR_COLOR,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {},
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              color: BG_COLOR,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                    color: SHADOW_COLOR,
                                    offset: Offset(0, 1),
                                    blurRadius: 6),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 20.0, left: 20, bottom: 20, top: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Flexible(
                                        child: Text(
                                      "John Doe",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800),
                                    )),
                                    SizedBox()
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Street 1305, Au, kerala\nStreet 1305, Au, kerala\nStreet 1305, Au, kerala',
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: const [
                                    Text("Phone:  "),
                                    Flexible(
                                        child: Text(
                                      "0123456789",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                          onTap: () {},
                                          child: const Text(
                                            "Edit",
                                            style: TextStyle(
                                              color: PRIMARY_COLOR,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )),
                                      InkWell(
                                          onTap: () {},
                                          child: const Text(
                                            "Delete",
                                            style: TextStyle(
                                              color: ERROR_COLOR,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
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
