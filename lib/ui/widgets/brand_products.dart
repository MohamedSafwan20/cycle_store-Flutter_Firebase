import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/data/models/product_model.dart';
import 'package:cycle_store/ui/widgets/primary_ghost_button.dart';
import 'package:cycle_store/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts(
      {Key? key, required this.products, required this.brandName})
      : super(key: key);

  final List<Product> products;
  final String brandName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 10),
          child: Text(
            brandName.capitalize!,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
          ),
        ),
        SizedBox(
          height: products.length > 2 ? 490 : 245,
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (MediaQuery.of(context).size.width / 498),
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 1),
              itemBuilder: (_, index) {
                return ProductCard(product: products[index]);
              }),
        ),
        const SizedBox(
          height: 15,
        ),
        PrimaryGhostButton(
            text: "See all",
            onPressed: () {
              Get.toNamed(PRODUCT_LIST_ROUTE, arguments: {
                "searchText": brandName,
                "products": products,
              });
            })
      ],
    );
  }
}
