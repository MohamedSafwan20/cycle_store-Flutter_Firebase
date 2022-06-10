import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/config/typography.dart';
import 'package:cycle_store/data/controllers/address_controller.dart';
import 'package:cycle_store/ui/widgets/custom_app_bar.dart';
import 'package:cycle_store/ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(AddressController());

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
              TextButton(
                  onPressed: () => Get.toNamed(ADD_EDIT_ROUTE),
                  child: const Text("+ Add address")),
              const SizedBox(
                height: 10,
              ),
              Obx(() {
                return _controller.isLoading.value
                    ? const Expanded(child: Loading())
                    : _controller.addresses.isEmpty
                        ? Expanded(
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "No Addresses",
                                  style: HEADING_1.copyWith(
                                    color: SECONDARY_TEXT_COLOR,
                                  ),
                                  textAlign: TextAlign.center,
                                )))
                        : SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: _controller.addresses.map((address) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (!address.isDefault) {
                                          _controller
                                              .makeAddressDefault(address);
                                        }
                                      },
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: BG_COLOR,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: SHADOW_COLOR,
                                                  offset: Offset(0, 1),
                                                  blurRadius: 6),
                                            ]),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 20.0,
                                              left: 20,
                                              bottom: 20,
                                              top: 25),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                      child: Text(
                                                    address.name,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  )),
                                                  address.isDefault
                                                      ? const Icon(
                                                          Icons
                                                              .download_done_outlined,
                                                          color: SUCCESS_COLOR,
                                                        )
                                                      : const SizedBox()
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "${address.locality}, ${address.city}, ${address.state} - ${address.pincode}\n${address.landmark}",
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  const Text("Phone:  "),
                                                  Flexible(
                                                      child: Text(
                                                    address.phone,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ))
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                        onTap: () =>
                                                            Get.toNamed(
                                                                ADD_EDIT_ROUTE),
                                                        child: const Text(
                                                          "Edit",
                                                          style: TextStyle(
                                                            color:
                                                                PRIMARY_COLOR,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        )),
                                                    InkWell(
                                                        onTap: () {},
                                                        child: const Text(
                                                          "Delete",
                                                          style: TextStyle(
                                                            color: ERROR_COLOR,
                                                            fontWeight:
                                                                FontWeight.w600,
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
                                    )
                                  ],
                                );
                              }).toList(),
                            ),
                          );
              })
            ],
          ),
        ),
      ),
    );
  }
}
