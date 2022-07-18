import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/data/models/product_model.dart';
import 'package:cycle_store/ui/widgets/loading.dart';
import 'package:cycle_store/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewArrivals extends StatelessWidget {
  const NewArrivals({Key? key, required this.products, required this.isLoading})
      : super(key: key);

  final List<Product> products;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Popular",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
            ),
            TextButton(
                onPressed: () {
                  Get.toNamed(PRODUCT_LIST_ROUTE,
                      arguments: {"searchText": "NEW_ARRIVALS"});
                },
                child: const Text(
                  "See all",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                ))
          ],
        ),
        SizedBox(
          height: 230,
          child: isLoading
              ? const Loading()
              : GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio:
                          (MediaQuery.of(context).size.width / 498),
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 1),
                  itemBuilder: (_, index) {
                    return ProductCard(product: products[index]);
                  }),
        )
      ],
    );
  }
}
