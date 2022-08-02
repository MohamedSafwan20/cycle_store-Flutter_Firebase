import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/typography.dart';
import 'package:cycle_store/ui/widgets/custom_app_bar.dart';
import 'package:cycle_store/ui/widgets/loading.dart';
import 'package:cycle_store/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../data/controllers/add_edit_address_controller.dart';

class AddEditAddress extends StatelessWidget {
  const AddEditAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(AddEditAddressController());

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: CustomAppBar(),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10),
                  child: Obx(() {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add Address",
                          style: HEADING_1,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 2.0),
                              child: Text(
                                "Name",
                                style: TextStyle(color: SECONDARY_TEXT_COLOR),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                controller: _controller.nameController,
                                decoration: InputDecoration(
                                  isDense: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: SECONDARY_TEXT_COLOR)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: SECONDARY_TEXT_COLOR)),
                                ),
                              ),
                            ),
                            _controller.isInvalidName.value
                                ? const Padding(
                                    padding: EdgeInsets.only(top: 5, left: 5),
                                    child: Text(
                                      "Invalid name",
                                      style: TextStyle(color: ERROR_COLOR),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 2.0),
                              child: Text(
                                "Phone",
                                style: TextStyle(color: SECONDARY_TEXT_COLOR),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                maxLength: 10,
                                controller: _controller.phoneController,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]'))
                                ],
                                decoration: InputDecoration(
                                  counterText: "",
                                  isDense: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: SECONDARY_TEXT_COLOR)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: SECONDARY_TEXT_COLOR)),
                                ),
                              ),
                            ),
                            _controller.isInvalidPhone.value
                                ? const Padding(
                                    padding: EdgeInsets.only(top: 5, left: 5),
                                    child: Text(
                                      "Invalid Phone",
                                      style: TextStyle(color: ERROR_COLOR),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
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
                                      "Pincode",
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
                                      onChanged: _controller.onPincodeChange,
                                      maxLength: 6,
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]'))
                                      ],
                                      controller: _controller.pincodeController,
                                      decoration: InputDecoration(
                                        counterText: "",
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
                                  _controller.isDeliveryAvailable.value
                                      ? const SizedBox()
                                      : const Padding(
                                          padding:
                                              EdgeInsets.only(top: 5, left: 5),
                                          child: Text(
                                            "Not Deliverable.",
                                            style:
                                                TextStyle(color: ERROR_COLOR),
                                          ),
                                        ),
                                  _controller.isInvalidPincode.value
                                      ? const Padding(
                                          padding:
                                              EdgeInsets.only(top: 5, left: 5),
                                          child: Text(
                                            "Invalid Pincode",
                                            style:
                                                TextStyle(color: ERROR_COLOR),
                                          ),
                                        )
                                      : const SizedBox(),
                                  _controller.isInvalidCity.value
                                      ? const Padding(
                                          padding:
                                              EdgeInsets.only(top: 5, left: 5),
                                          child: Text(
                                            "",
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
                                      "City",
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
                                      controller: _controller.cityController,
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
                                  _controller.isInvalidCity.value
                                      ? const Padding(
                                          padding:
                                              EdgeInsets.only(top: 5, left: 5),
                                          child: Text(
                                            "Invalid City",
                                            style:
                                                TextStyle(color: ERROR_COLOR),
                                          ),
                                        )
                                      : const SizedBox(),
                                  _controller.isDeliveryAvailable.value
                                      ? const SizedBox()
                                      : const Padding(
                                          padding:
                                              EdgeInsets.only(top: 5, left: 5),
                                          child: Text(
                                            "",
                                          ),
                                        ),
                                  _controller.isInvalidPincode.value
                                      ? const Padding(
                                          padding:
                                              EdgeInsets.only(top: 5, left: 5),
                                          child: Text(
                                            "",
                                          ),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 2.0),
                              child: Text(
                                "State",
                                style: TextStyle(color: SECONDARY_TEXT_COLOR),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                controller: _controller.stateController,
                                decoration: InputDecoration(
                                  isDense: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: SECONDARY_TEXT_COLOR)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: SECONDARY_TEXT_COLOR)),
                                ),
                              ),
                            ),
                            _controller.isInvalidState.value
                                ? const Padding(
                                    padding: EdgeInsets.only(top: 5, left: 5),
                                    child: Text(
                                      "Invalid State",
                                      style: TextStyle(color: ERROR_COLOR),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 2.0),
                              child: Text(
                                "Locality / Area / Street",
                                style: TextStyle(color: SECONDARY_TEXT_COLOR),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                controller: _controller.localityController,
                                decoration: InputDecoration(
                                  isDense: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: SECONDARY_TEXT_COLOR)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: SECONDARY_TEXT_COLOR)),
                                ),
                              ),
                            ),
                            _controller.isInvalidLocality.value
                                ? const Padding(
                                    padding: EdgeInsets.only(top: 5, left: 5),
                                    child: Text(
                                      "Invalid Locality",
                                      style: TextStyle(color: ERROR_COLOR),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 2.0),
                              child: Text(
                                "Landmark (optional)",
                                style: TextStyle(color: SECONDARY_TEXT_COLOR),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                controller: _controller.landmarkController,
                                decoration: InputDecoration(
                                  isDense: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: SECONDARY_TEXT_COLOR)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: SECONDARY_TEXT_COLOR)),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Checkbox(
                                value: _controller.isDefaultAddress.value,
                                onChanged: (value) {
                                  _controller.onDefaultAddressChange();
                                }),
                            GestureDetector(
                              onTap: () {
                                _controller.onDefaultAddressChange();
                              },
                              child: const Text(
                                "Select this address",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: _controller.isLoading.value
                              ? const Loading()
                              : PrimaryButton(
                                  textStyle: const TextStyle(fontSize: 17),
                                  text: "Save Address",
                                  onPressed: () {
                                    _controller.addAddress();
                                  },
                                  height: 50,
                                  width: MediaQuery.of(context).size.width - 70,
                                  borderRadius: 10,
                                ),
                        ),
                        const SizedBox(
                          height: 20,
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
