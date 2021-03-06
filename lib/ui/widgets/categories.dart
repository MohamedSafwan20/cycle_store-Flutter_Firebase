import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/typography.dart';
import 'package:cycle_store/data/controllers/category_controller.dart';
import 'package:cycle_store/ui/widgets/loading.dart';
import 'package:cycle_store/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    const categories = [
      "All",
      "Roadbike",
      "Mountain",
      "Kids",
      "Urban",
    ];
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Categories",
                  style: HEADING_1,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: 30,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Obx(() {
                          final isSelected =
                              _controller.currentCategory.value == index;

                          return GestureDetector(
                            onTap: () {
                              _controller.onCategoryChange(index: index);
                            },
                            child: Padding(
                              padding: index == 0
                                  ? const EdgeInsets.only(right: 10.0)
                                  : const EdgeInsets.symmetric(
                                  horizontal: 10.0),
                              child: Column(
                                children: [
                                  Text(
                                    categories[index],
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.w400,
                                      color: isSelected
                                          ? PRIMARY_COLOR
                                          : SECONDARY_TEXT_COLOR,
                                    ),
                                  ),
                                  isSelected
                                      ? Container(
                                    width: 5,
                                    height: 5,
                                    margin: const EdgeInsets.only(top: 2),
                                    decoration: const BoxDecoration(
                                        color: PRIMARY_COLOR,
                                        shape: BoxShape.circle),
                                        )
                                      : const SizedBox()
                                ],
                              ),
                            ),
                          );
                        });
                      }),
                ),
              ),
              Obx(() {
                return _controller.isLoading.value
                    ? Container(
                        height: size.height - 300,
                        alignment: Alignment.center,
                        child: const Loading())
                    : _controller.products.isNotEmpty
                        ? Expanded(
                            child: GridView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: _controller.products.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: (size.width / 448),
                                        mainAxisSpacing: 8,
                                        crossAxisSpacing: 1),
                                itemBuilder: (_, index) {
                                  return ProductCard(
                                      product: _controller.products[index]);
                                }),
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
