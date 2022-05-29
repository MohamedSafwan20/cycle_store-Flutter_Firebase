import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(PRODUCT_DETAILS_ROUTE),
      child: SizedBox(
        width: 170,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                width: double.infinity,
                height: 150,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8)),
                  child: Image.network(
                    product.thumbnail,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(product.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 48,
                                child: Text("In stock:",
                                    style: TextStyle(
                                        color: SUCCESS_COLOR,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600)),
                              ),
                              SizedBox(
                                width: 22,
                                child: Text(
                                  product.stock.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            "₹${product.price}",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: PRIMARY_COLOR,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        width: 55,
                        padding: const EdgeInsets.only(right: 5),
                        child: TextButton(
                          onPressed: () {},
                          child: const Icon(Icons.shopping_bag_outlined),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(PRIMARY_COLOR),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
