import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/config/typography.dart';
import 'package:cycle_store/data/controllers/checkout_controller.dart';
import 'package:cycle_store/ui/widgets/custom_app_bar.dart';
import 'package:cycle_store/ui/widgets/loading.dart';
import 'package:cycle_store/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(CheckoutController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CustomAppBar(),
          const SizedBox(
            height: 15,
          ),
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery Address",
                      style: HEADING_1,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.offNamed(ADDRESS_ROUTE);
                        },
                        child: const Text("Change"))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() {
                  return _controller.isAddressLoading.value
                      ? const SizedBox(
                          height: 120,
                          child: Loading(
                            loader: LoadingAnimationWidget.beat,
                          ))
                      : _controller.hasNoDefaultAddress.value
                          ? Container(
                              height: 120,
                              alignment: Alignment.center,
                              child: TextButton.icon(
                                label: const Text("Select Address"),
                                icon: const Icon(
                                  Icons.add_outlined,
                                  color: PRIMARY_COLOR,
                                ),
                                onPressed: () {
                                  Get.offNamed(ADDRESS_ROUTE);
                                },
                              ))
                          : Container(
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
                                    Text(
                                      _controller.defaultAddress[0].name,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${_controller.defaultAddress[0].locality}, ${_controller.defaultAddress[0].city}, ${_controller.defaultAddress[0].state} - ${_controller.defaultAddress[0].pincode}\n${_controller.defaultAddress[0].landmark}",
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Text("Phone:  "),
                                        Flexible(
                                            child: Text(
                                          _controller.defaultAddress[0].phone,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                }),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Payment Method",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Cash on delivery (COD)",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Order Info",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total",
                            style: TextStyle(
                                color: SECONDARY_TEXT_COLOR, fontSize: 15),
                          ),
                          Text(
                            "₹" + _controller.price.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Shipping Cost",
                            style: TextStyle(
                                color: SECONDARY_TEXT_COLOR, fontSize: 15),
                          ),
                          Text(
                            "₹0",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          )),
          PrimaryButton(
            text: "Place Order",
            onPressed: () {},
            width: double.infinity,
            height: 47,
            textStyle: const TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          )
        ]),
      )),
    );
  }
}
