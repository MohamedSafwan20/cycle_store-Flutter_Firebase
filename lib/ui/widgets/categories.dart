import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/typography.dart';
import 'package:cycle_store/data/controllers/category_controller.dart';
import 'package:cycle_store/ui/widgets/loading.dart';
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
