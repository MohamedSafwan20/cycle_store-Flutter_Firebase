import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/data/controllers/product_details_controller.dart';
import 'package:cycle_store/ui/widgets/custom_app_bar.dart';
import 'package:cycle_store/ui/widgets/loading.dart';
import 'package:cycle_store/ui/widgets/primary_button.dart';
import 'package:cycle_store/ui/widgets/secondary_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(ProductDetailsController());

    return Scaffold(
      backgroundColor: SECONDARY_COLOR,
      body: SafeArea(
        child: Obx(() {
          final isProductInCart =
              _controller.productsInCart.contains(_controller.product.id);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: CustomAppBar(
                    actions: [
                      {
                        "icon": Icons.shopping_bag_outlined,
                        "onPressed": () => Get.toNamed(CART_ROUTE)
                      }
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(IMAGE_VIEWER_ROUTE,
                              arguments: {"images": _controller.images});
                        },
                        child: Container(
                          height: 260,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(70),
                                  bottomLeft: Radius.circular(70))),
                          child: Column(
                            children: [
                              CarouselSlider.builder(
                                  carouselController:
                                      _controller.carouselController,
                                  options: CarouselOptions(
                                    onPageChanged: _controller.onCarouselChange,
                                    height: 200,
                                    viewportFraction: 0.8,
                                    initialPage: 0,
                                    enlargeCenterPage: true,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                  itemCount: _controller.images.length,
                                  itemBuilder: (BuildContext context,
                                      int itemIndex, int pageViewIndex) {
                                    return CachedNetworkImage(
                                      imageUrl: _controller.images[itemIndex],
                                      imageBuilder: (_, imageProvider) {
                                        return Image(
                                          image: imageProvider,
                                        );
                                      },
                                      placeholder: (context, value) {
                                        return const Loading(
                                            loader:
                                                LoadingAnimationWidget.beat);
                                      },
                                    );
                                  }),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: _controller.images
                                    .asMap()
                                    .entries
                                    .map((entry) => GestureDetector(
                                          onTap: () {
                                            _controller
                                                .onCarouselIndicatorChange(
                                                    entry.key);
                                          },
                                          child: Container(
                                            height: 10,
                                            width: 10,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 4),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: entry.key ==
                                                            _controller
                                                                .currentCarouselImage
                                                                .value
                                                        ? PRIMARY_COLOR
                                                        : SECONDARY_TEXT_COLOR),
                                                color: entry.key ==
                                                        _controller
                                                            .currentCarouselImage
                                                            .value
                                                    ? PRIMARY_COLOR
                                                    : Colors.transparent),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _controller.product.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 19),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "WHEEL SIZE",
                              style: TextStyle(color: SECONDARY_TEXT_COLOR),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6.0),
                              child: Row(
                                children: _controller.product.sizes
                                    .asMap()
                                    .entries
                                    .map((size) {
                                  return Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          _controller.onSizeChange(
                                              selectedSize: size.value);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: _controller
                                                                .selectedSizeIndex
                                                                .value ==
                                                            size.value
                                                        ? PRIMARY_COLOR
                                                        : SHADOW_COLOR,
                                                    offset: const Offset(1, 1),
                                                    blurRadius: 6),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: _controller
                                                          .selectedSizeIndex
                                                          .value ==
                                                      size.value
                                                  ? PRIMARY_COLOR
                                                  : Colors.white),
                                          height: 36,
                                          width: 36,
                                          alignment: Alignment.center,
                                          child: Text(size.value,
                                              style: TextStyle(
                                                  color: _controller
                                                              .selectedSizeIndex
                                                              .value ==
                                                          size.value
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      )
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            SizedBox(
                              width: 150,
                              child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: const [
                                    Text("VIEW SIZE CHART"),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 15,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.payments_outlined,
                                    size: 32,
                                    color: SECONDARY_TEXT_COLOR,
                                  ),
                                  Text(
                                    "CASH ON DELIVERY",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.local_shipping_outlined,
                                    size: 32,
                                    color: SECONDARY_TEXT_COLOR,
                                  ),
                                  Text(
                                    "FREE SHIPPING",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.credit_card_outlined,
                                    size: 32,
                                    color: SECONDARY_TEXT_COLOR,
                                  ),
                                  Text(
                                    "EMI AVAILABLE",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.inventory_outlined,
                                    size: 32,
                                    color: SECONDARY_TEXT_COLOR,
                                  ),
                                  Text(
                                    "FULLY ASSEMBLED",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(20),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Check Delivery",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 17),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 170,
                                  height: 45,
                                  child: TextField(
                                    maxLength: 6,
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]'))
                                    ],
                                    decoration: const InputDecoration(
                                        counterText: "",
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 12),
                                        hintText: "Enter pincode",
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintStyle: TextStyle(fontSize: 13),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: SECONDARY_TEXT_COLOR),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                topRight: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                bottomLeft:
                                                    Radius.circular(5))),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: SECONDARY_TEXT_COLOR),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                topRight: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                bottomLeft:
                                                    Radius.circular(5))),
                                        disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: SECONDARY_TEXT_COLOR),
                                            borderRadius:
                                                BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(0), bottomRight: Radius.circular(0), bottomLeft: Radius.circular(5)))),
                                  ),
                                ),
                                PrimaryButton(
                                  text: "Check",
                                  onPressed: () {},
                                  width: 100,
                                  height: 45,
                                  borderRadiusOnly: const [0, 5, 5, 0],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            const Text(
                              "Delivery Available to this Pincode.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: SUCCESS_COLOR),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(20),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Specifications",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 17),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              children:
                                  _controller.productSpecs.entries.map((e) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.key,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          Row(
                                              children: e.value.entries.map<
                                                      Widget>(
                                                  (MapEntry<String, String> e) {
                                            return Row(
                                              children: [
                                                SizedBox(
                                                    width: 150,
                                                    child: Text(
                                                      e.key.capitalize!,
                                                      style: const TextStyle(
                                                          color:
                                                              SECONDARY_TEXT_COLOR,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )),
                                                Text(
                                                  e.value.capitalize!,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            );
                                          }).toList()),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                );
                              }).toList(),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 80,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text(
                            "₹" + _controller.product.price.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 17),
                      )),
                      const SizedBox(
                        width: 20,
                      ),
                      Row(
                        children: [
                          SecondaryIconButton(
                            icon: isProductInCart
                                ? Icons.done
                                : Icons.shopping_bag_outlined,
                            onPressed: () {
                              if (isProductInCart) {
                                _controller.removeFromCart();
                              } else {
                                _controller.addToCart();
                              }
                            },
                            width: 50,
                            borderRadius: 7,
                            height: 42,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          PrimaryButton(
                            text: "Buy now",
                            onPressed: () {
                              _controller.handleBuyNowBtn();
                            },
                            height: 42,
                            width: 120,
                            borderRadius: 8,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
