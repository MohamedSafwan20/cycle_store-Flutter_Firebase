import 'package:cycle_store/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controllers/product_list_controller.dart';

class SortProductsModal extends StatelessWidget {
  const SortProductsModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<ProductListController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          color: SHADOW_COLOR,
          thickness: 0.85,
        ),
        Obx(() {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Price",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Row(
                  children: [
                    Radio(
                      value: 0,
                      groupValue: _controller.currentPriceSortIndex.value,
                      onChanged: (value) {
                        _controller.onPriceSortChange(index: value as int);
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        _controller.onPriceSortChange(index: 0);
                      },
                      child: const Text(
                        "Random",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: _controller.currentPriceSortIndex.value,
                      onChanged: (value) {
                        _controller.onPriceSortChange(index: value as int);
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        _controller.onPriceSortChange(index: 1);
                      },
                      child: const Text(
                        "High to Low",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: _controller.currentPriceSortIndex.value,
                      onChanged: (value) {
                        _controller.onPriceSortChange(index: value as int);
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        _controller.onPriceSortChange(index: 2);
                      },
                      child: const Text(
                        "Low to High",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        })
      ],
    );
  }
}
