import 'package:cycle_store/config/colors.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = "TDR 300000000000000000000";

    return SizedBox(
      width: 200,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              width: double.infinity,
              height: 150,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15)),
                child: Image.network(
                  "http://picsum.photos/300/300",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                  title.length > 13 ? "${title.substring(0, 12)}.." : title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.star,
                            color: GOLD_COLOR,
                            size: 18,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              "4.8 (2200)",
                              style: TextStyle(color: SECONDARY_TEXT_COLOR),
                            ),
                          )
                        ],
                      ),
                      const Text(
                        "₹14000",
                        style: TextStyle(
                            color: PRIMARY_COLOR,
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      ),
                    ],
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
    );
  }
}
