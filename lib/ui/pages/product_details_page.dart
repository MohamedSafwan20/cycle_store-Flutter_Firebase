import 'package:carousel_slider/carousel_slider.dart';
import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/config/typography.dart';
import 'package:cycle_store/data/controllers/product_details_controller.dart';
import 'package:cycle_store/ui/widgets/custom_app_bar.dart';
import 'package:cycle_store/ui/widgets/primary_button.dart';
import 'package:cycle_store/ui/widgets/secondary_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(ProductDetailsController());

    return Scaffold(
      backgroundColor: SECONDARY_COLOR,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: CustomAppBar(
                  actions: [
                    {"icon": Icons.shopping_bag_outlined, "onPressed": () {}}
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
                      child: Obx(() {
                        return Column(
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
                                  return Image.asset(
                                      _controller.images[itemIndex]);
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
                                                  color: SECONDARY_TEXT_COLOR),
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
                        );
                      }),
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
                            "TDR 3000",
                            style: HEADING_1,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Lorem ipsum dolor sit amet consecteturadipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur voluptatumng elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur voluptatumng elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur voluptatumng elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur voluptatumng elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur voluptatumng elit. Maximesint commodi repudiandae consequuntur voluptatumng elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur voluptatumng elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur voluptatumng elit. Maximesint commodi repudiandae consequuntur voluptatumng elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur voluptatumng elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur voluptatumng elit. Maxime",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Obx(() {
                            return Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    _controller.onSizeChange(selectedSize: 0);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: _controller
                                                          .selectedSizeIndex
                                                          .value ==
                                                      0
                                                  ? PRIMARY_COLOR
                                                  : SHADOW_COLOR,
                                              offset: const Offset(1, 1),
                                              blurRadius: 6),
                                        ],
                                        borderRadius: BorderRadius.circular(5),
                                        color: _controller
                                                    .selectedSizeIndex.value ==
                                                0
                                            ? PRIMARY_COLOR
                                            : Colors.white),
                                    height: 36,
                                    width: 36,
                                    alignment: Alignment.center,
                                    child: Text("S",
                                        style: TextStyle(
                                            color: _controller.selectedSizeIndex
                                                        .value ==
                                                    0
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    _controller.onSizeChange(selectedSize: 1);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: _controller.selectedSizeIndex
                                                        .value ==
                                                    1
                                                ? PRIMARY_COLOR
                                                : SHADOW_COLOR,
                                            offset: const Offset(1, 1),
                                            blurRadius: 6,
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(5),
                                        color: _controller
                                                    .selectedSizeIndex.value ==
                                                1
                                            ? PRIMARY_COLOR
                                            : Colors.white),
                                    height: 36,
                                    width: 36,
                                    alignment: Alignment.center,
                                    child: Text("M",
                                        style: TextStyle(
                                            color: _controller.selectedSizeIndex
                                                        .value ==
                                                    1
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    _controller.onSizeChange(selectedSize: 2);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: _controller
                                                          .selectedSizeIndex
                                                          .value ==
                                                      2
                                                  ? PRIMARY_COLOR
                                                  : SHADOW_COLOR,
                                              offset: const Offset(1, 1),
                                              blurRadius: 6)
                                        ],
                                        borderRadius: BorderRadius.circular(5),
                                        color: _controller
                                                    .selectedSizeIndex.value ==
                                                2
                                            ? PRIMARY_COLOR
                                            : Colors.white),
                                    height: 36,
                                    width: 36,
                                    alignment: Alignment.center,
                                    child: Text("L",
                                        style: TextStyle(
                                            color: _controller.selectedSizeIndex
                                                        .value ==
                                                    2
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            );
                          })
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
                    const Flexible(
                        child: Text(
                      "₹14000",
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    )),
                    const SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        SecondaryIconButton(
                          icon: Icons.shopping_bag_outlined,
                          onPressed: () {},
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
                          borderRadius: 8,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
