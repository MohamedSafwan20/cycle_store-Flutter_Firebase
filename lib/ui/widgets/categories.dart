import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/typography.dart';
import 'package:cycle_store/data/controllers/category_controller.dart';
import 'package:cycle_store/ui/widgets/product_card.dart';
import 'package:cycle_store/ui/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const categories = [
      "All",
      "Roadbike",
      "Mountain",
      "Kids",
      "Urban",
      "Urban"
    ];
    final _controller = Get.put(CategoryController());

    return Stack(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Search(),
        ),
        Container(
          margin: const EdgeInsets.only(top: 100),
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
                                      fontSize: 16,
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
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 10,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 200 / 260,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 1),
                    itemBuilder: (_, index) {
                      return const ProductCard();
                    }),
              ),
            ],
          ),
        )
      ],
    );
  }
}
