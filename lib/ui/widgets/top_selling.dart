import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopSelling extends StatelessWidget {
  const TopSelling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Top Selling",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900),
            ),
            TextButton(
                onPressed: () => Get.toNamed(PRODUCT_LIST_ROUTE),
                child: const Text(
                  "See all",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ))
          ],
        ),
        SizedBox(
          height: 240,
          child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: index == 0
                      ? const EdgeInsets.only(right: 3)
                      : const EdgeInsets.symmetric(horizontal: 3),
                  child: const ProductCard(),
                );
              }),
        )
      ],
    );
  }
}
