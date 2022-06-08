import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/config/typography.dart';
import 'package:cycle_store/data/controllers/product_details_controller.dart';
import 'package:cycle_store/ui/widgets/custom_app_bar.dart';
import 'package:cycle_store/ui/widgets/loading.dart';
import 'package:cycle_store/ui/widgets/primary_button.dart';
import 'package:cycle_store/ui/widgets/secondary_icon_button.dart';
import 'package:flutter/material.dart';
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
                      Container(
                        height: 260,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(100),
                                bottomLeft: Radius.circular(100))),
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
                                          loader: LoadingAnimationWidget.beat);
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
                                          _controller.onCarouselIndicatorChange(
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
                              style: HEADING_1,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              _controller.product.description,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: _controller.product.sizes
                                  .asMap()
                                  .entries
                                  .map((size) {
                                return Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        _controller.onSizeChange(
                                            selectedSize: size.key);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: _controller
                                                              .selectedSizeIndex
                                                              .value ==
                                                          size.key
                                                      ? PRIMARY_COLOR
                                                      : SHADOW_COLOR,
                                                  offset: const Offset(1, 1),
                                                  blurRadius: 6),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: _controller.selectedSizeIndex
                                                        .value ==
                                                    size.key
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
                                                        size.key
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
                            fontWeight: FontWeight.w800, fontSize: 20),
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
                            onPressed: () => Get.toNamed(CHECKOUT_ROUTE),
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
