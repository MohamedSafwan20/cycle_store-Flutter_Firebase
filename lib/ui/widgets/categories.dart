import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/typography.dart';
import 'package:cycle_store/data/controllers/category_controller.dart';
import 'package:cycle_store/ui/widgets/custom_carousel.dart';
import 'package:cycle_store/ui/widgets/loading.dart';
import 'package:cycle_store/ui/widgets/primary_ghost_button.dart';
import 'package:cycle_store/ui/widgets/product_card.dart';
import 'package:cycle_store/ui/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final _controller = Get.put(CategoryController());
    _controller.getAllProducts();

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
                    : _controller.products.isNotEmpty
                        ? Expanded(
                            child: SingleChildScrollView(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomCarousel(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14.0, vertical: 15),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Popular",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          SizedBox(
                                              height: 30,
                                              child: TextButton(
                                                  onPressed: () {},
                                                  child: const Text(
                                                    "See all",
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  )))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 235,
                                        child: ListView.builder(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                _controller.products.length,
                                            itemBuilder: (context, index) {
                                              return SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2,
                                                  child: ProductCard(
                                                      product: _controller
                                                          .products[index]));
                                            }),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Trending",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          SizedBox(
                                              height: 30,
                                              child: TextButton(
                                                  onPressed: () {},
                                                  child: const Text(
                                                    "See all",
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  )))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 235,
                                        child: ListView.builder(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                _controller.products.length,
                                            itemBuilder: (context, index) {
                                              return SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2,
                                                  child: ProductCard(
                                                      product: _controller
                                                          .products[index]));
                                            }),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      PrimaryGhostButton(
                                          text: "See all Bikes",
                                          onPressed: () {})
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
