import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/data/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectCategoryModal extends StatelessWidget {
  const SelectCategoryModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<CategoryController>();

    return Column(
      children: [
        const Divider(
          color: SHADOW_COLOR,
          thickness: 0.85,
        ),
        SizedBox(
          height: 200,
          width: double.maxFinite,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _controller.categories.length,
              itemBuilder: (context, index) {
                return Obx(() {
                  return InkWell(
                    onTap: () {
                      _controller.onCategoryChange(index: index);
                      Get.back();
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(
                              _controller.categories[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: index ==
                                          _controller.currentCategoryIndex.value
                                      ? PRIMARY_COLOR
                                      : Colors.black),
                            ),
                            index == _controller.currentCategoryIndex.value
                                ? Container(
                                    height: 3,
                                    width: 3,
                                    decoration: const BoxDecoration(
                                        color: PRIMARY_COLOR,
                                        shape: BoxShape.circle),
                                  )
                                : const SizedBox()
                          ],
                        ),
                      ),
                    ),
                  );
                });
              }),
        )
      ],
    );
  }
}
