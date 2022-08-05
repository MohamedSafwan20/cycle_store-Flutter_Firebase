import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/config/typography.dart';
import 'package:cycle_store/data/controllers/category_controller.dart';
import 'package:cycle_store/ui/widgets/custom_carousel.dart';
import 'package:cycle_store/ui/widgets/loading.dart';
import 'package:cycle_store/ui/widgets/primary_ghost_button.dart';
import 'package:cycle_store/ui/widgets/product_card.dart';
import 'package:cycle_store/ui/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final _controller = Get.put(CategoryController());

    return Stack(
      children: [
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  "Categories",
                  style: HEADING_1.copyWith(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Obx(() {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SecondaryButton(
                    text: _controller
                        .categories[_controller.currentCategoryIndex.value],
                    onPressed: _controller.showDialog,
                    width: 160,
                    height: 35,
                    icon: Icons.arrow_drop_down,
                  ),
                );
              }),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                return _controller.isLoading.value
                    ? Container(
                        height: size.height - 300,
                        alignment: Alignment.center,
                        child: const Loading())
                    : _controller.popularProducts.isNotEmpty
                        ? Expanded(
                            child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                        child: _controller
                                                .carouselImages.isEmpty
                                            ? const SizedBox()
                                            : _controller
                                                    .isCarouselLoading.value
                                                ? SizedBox(
                                                    height: 200,
                                                    child: Loading(
                                                        loader:
                                                            LoadingAnimationWidget
                                                                .prograssiveDots))
                                                : CustomCarousel(
                                                    images: _controller
                                                        .carouselImages,
                                                  ),
                                        onTap: () {
                                          Get.toNamed(PRODUCT_LIST_ROUTE,
                                              arguments: {
                                                "searchText": _controller
                                                            .currentCategoryIndex
                                                            .value ==
                                                        0
                                                    ? "All"
                                                    : _controller
                                                                .currentCategoryIndex
                                                                .value ==
                                                            1
                                                        ? "Mountain"
                                                        : _controller
                                                                    .currentCategoryIndex
                                                                    .value ==
                                                                2
                                                            ? "Sports"
                                                            : _controller
                                                                        .currentCategoryIndex
                                                                        .value ==
                                                                    3
                                                                ? "Kids"
                                                                : _controller
                                                                            .currentCategoryIndex
                                                                            .value ==
                                                                        4
                                                                    ? "Urban"
                                                                    : "Trending",
                                                "products":
                                                    _controller.popularProducts,
                                              });
                                        }),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14.0, vertical: 15),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                _controller.currentCategoryIndex
                                                            .value ==
                                                        0
                                                    ? "Popular in all bikes"
                                                    : _controller
                                                                .currentCategoryIndex
                                                                .value ==
                                                            1
                                                        ? "Popular in mountain bikes"
                                                        : _controller
                                                                    .currentCategoryIndex
                                                                    .value ==
                                                                2
                                                            ? "Popular in sports bikes"
                                                            : _controller
                                                                        .currentCategoryIndex
                                                                        .value ==
                                                                    3
                                                                ? "Popular in kids bikes"
                                                                : _controller
                                                                            .currentCategoryIndex
                                                                            .value ==
                                                                        4
                                                                    ? "Popular in urban bikes"
                                                                    : "Popular",
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        PRODUCT_LIST_ROUTE,
                                                        arguments: {
                                                          "searchText":
                                                              "Popular",
                                                          "products": _controller
                                                              .popularProducts,
                                                        });
                                                  },
                                                  child: const Text(
                                                    "See all",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: PRIMARY_COLOR,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ))
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            height: 235,
                                            child: ListView.builder(
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: _controller
                                                            .popularProducts
                                                            .length >
                                                        6
                                                    ? 6
                                                    : _controller
                                                        .popularProducts.length,
                                                itemBuilder: (context, index) {
                                                  return SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.19,
                                                      child: ProductCard(
                                                          product: _controller
                                                                  .popularProducts[
                                                              index]));
                                                }),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          _controller
                                                  .trendingProducts.isNotEmpty
                                              ? Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          _controller.currentCategoryIndex
                                                                      .value ==
                                                                  0
                                                              ? "Trending in all bikes"
                                                              : _controller
                                                                          .currentCategoryIndex
                                                                          .value ==
                                                                      1
                                                                  ? "Trending in mountain bikes"
                                                                  : _controller
                                                                              .currentCategoryIndex
                                                                              .value ==
                                                                          2
                                                                      ? "Trending in sports bikes"
                                                                      : _controller.currentCategoryIndex.value ==
                                                                              3
                                                                          ? "Trending in kids bikes"
                                                                          : _controller.currentCategoryIndex.value == 4
                                                                              ? "Trending in urban bikes"
                                                                              : "Trending",
                                                          style: const TextStyle(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                        ),
                                                        InkWell(
                                                            onTap: () {
                                                              Get.toNamed(
                                                                  PRODUCT_LIST_ROUTE,
                                                                  arguments: {
                                                                    "searchText":
                                                                        "Trending",
                                                                    "products":
                                                                        _controller
                                                                            .trendingProducts,
                                                                  });
                                                            },
                                                            child: const Text(
                                                              "See all",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color:
                                                                      PRIMARY_COLOR,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ))
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    SizedBox(
                                                      height: 235,
                                                      child: ListView.builder(
                                                          physics:
                                                              const BouncingScrollPhysics(),
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount: _controller
                                                                      .trendingProducts
                                                                      .length >
                                                                  6
                                                              ? 6
                                                              : _controller
                                                                  .trendingProducts
                                                                  .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    2.19,
                                                                child: ProductCard(
                                                                    product: _controller
                                                                            .trendingProducts[
                                                                        index]));
                                                          }),
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                  ],
                                                )
                                              : const SizedBox(),
                                          PrimaryGhostButton(
                                              text: _controller
                                                          .currentCategoryIndex
                                                          .value ==
                                                      0
                                                  ? "See all bikes"
                                                  : _controller
                                                              .currentCategoryIndex
                                                              .value ==
                                                          1
                                                      ? "See all mountain bikes"
                                                      : _controller
                                                                  .currentCategoryIndex
                                                                  .value ==
                                                              2
                                                          ? "See all sports bikes"
                                                          : _controller
                                                                      .currentCategoryIndex
                                                                      .value ==
                                                                  3
                                                              ? "See all kids bikes"
                                                              : _controller
                                                                          .currentCategoryIndex
                                                                          .value ==
                                                                      4
                                                                  ? "See all urban bikes"
                                                                  : "See all",
                                              onPressed: () {
                                                Get.toNamed(PRODUCT_LIST_ROUTE,
                                                    arguments: {
                                                      "searchText": _controller
                                                                  .currentCategoryIndex
                                                                  .value ==
                                                              0
                                                          ? "All"
                                                          : _controller
                                                                      .currentCategoryIndex
                                                                      .value ==
                                                                  1
                                                              ? "Mountain"
                                                              : _controller
                                                                          .currentCategoryIndex
                                                                          .value ==
                                                                      2
                                                                  ? "Sports"
                                                                  : _controller
                                                                              .currentCategoryIndex
                                                                              .value ==
                                                                          3
                                                                      ? "Kids"
                                                                      : _controller.currentCategoryIndex.value ==
                                                                              4
                                                                          ? "Urban"
                                                                          : "Trending",
                                                      "products": _controller
                                                          .popularProducts,
                                                    });
                                              })
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          )
                        : Container(
                            height: size.height - 300,
                            alignment: Alignment.center,
                            child: Text(
                              "No Bikes",
                              style: HEADING_1.copyWith(
                                  color: SECONDARY_TEXT_COLOR),
                            ));
              }),
            ],
          ),
        )
      ],
    );
  }
}
