import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/config/typography.dart';
import 'package:cycle_store/data/controllers/cart_controller.dart';
import 'package:cycle_store/ui/widgets/cart_item.dart';
import 'package:cycle_store/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/loading.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(CartController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(15),
              child: CustomAppBar(),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("My Bag", style: HEADING_1),
                  Obx(() {
                    return Text("${_controller.checkoutProducts.length} Items",
                        style: const TextStyle(
                            color: SECONDARY_TEXT_COLOR, fontSize: 14));
                  }),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Obx(() {
              return Expanded(
                  child: _controller.isLoading.value
                      ? const Loading()
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: _controller.products.length,
                          itemBuilder: (_, index) {
                            return InkWell(
                                onTap: () => Get.toNamed(PRODUCT_DETAILS_ROUTE,
                                        arguments: {
                                          "product": _controller.products[index]
                                              ["product"]
                                        }),
                                child: Dismissible(
                                  onDismissed: (dismissDirection) {
                                    _controller.deleteCartItem(
                                        productId: _controller
                                            .products[index]["product"].id,
                                        size: _controller.products[index]
                                            ["size"],
                                        productPrice: _controller
                                            .products[index]["product"].price);
                                  },
                                  direction: DismissDirection.endToStart,
                                  background: const SizedBox(),
                                  key: Key(_controller
                                      .products[index]["product"].id),
                                  secondaryBackground: Container(
                                    padding: const EdgeInsets.only(right: 20),
                                    alignment: Alignment.centerRight,
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                    color: ERROR_COLOR,
                                  ),
                                  child: CartItem(
                                      index: index,
                                      product: _controller.products[index]
                                          ["product"],
                                      size: _controller.products[index]
                                          ["size"]),
                                ));
                          }));
            }),
            Obx(() {
              return Container(
                height: 120,
                decoration: const BoxDecoration(
                    color: PRIMARY_COLOR,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "₹" + _controller.price.value.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 240,
                      height: 45,
                      child: TextButton(
                        onPressed: () {
                          _controller.handleProceedBtn();
                        },
                        child: const Text(
                          "Proceed to Payment",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                      ),
                    )
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
