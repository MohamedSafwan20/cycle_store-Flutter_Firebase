import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = "TDR 3000000";

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
                    "http://picsum.photos/300/300",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
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
                              const Icon(
                                Icons.star,
                                color: GOLD_COLOR,
                                size: 18,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 5.0),
                                width: 50,
                                child: const Text(
                                  "4.8 (2200)",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: SECONDARY_TEXT_COLOR,
                                      fontSize: 12),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            "₹14000",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
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
