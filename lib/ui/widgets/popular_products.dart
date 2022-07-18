import 'package:cycle_store/data/models/product_model.dart';
import 'package:cycle_store/ui/widgets/loading.dart';
import 'package:cycle_store/ui/widgets/primary_ghost_button.dart';
import 'package:cycle_store/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts(
      {Key? key, required this.products, required this.isLoading})
      : super(key: key);

  final List<Product> products;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 10),
          child: Text(
            "Popular",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
          ),
        ),
        SizedBox(
          height: 470,
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
        ),
        PrimaryGhostButton(text: "See all", onPressed: () {})
      ],
    );
  }
}