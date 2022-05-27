import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/config/typography.dart';
import 'package:cycle_store/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderSummaryPage extends StatelessWidget {
  const OrderSummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomAppBar(
            actions: [
              {
                "icon": Icons.headset_mic_outlined,
                "onPressed": () => Get.toNamed(CONTACT_ROUTE)
              }
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Order #TY3434334",
            style: HEADING_1,
          ),
        ]),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 350,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (_, index) {
                        return TimelineTile(
                          afterLineStyle: const LineStyle(
                              thickness: 2, color: PRIMARY_COLOR),
                          beforeLineStyle: const LineStyle(
                              thickness: 2, color: PRIMARY_COLOR),
                          indicatorStyle: const IndicatorStyle(
                              height: 25, color: PRIMARY_COLOR
                              // indicator: Container(
                              //   decoration: BoxDecoration(
                              //     border: Border.all(color: PRIMARY_COLOR, width: 3),
                              //     shape: BoxShape.circle,
                              //     color: Colors.white
                              //   ),
                              // )
                              ),
                          isFirst: index == 0 ? true : false,
                          isLast: index == 2 ? true : false,
                          endChild: Container(
                            height: (350 / 3),
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Order Placed on 25 july",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: SECONDARY_TEXT_COLOR),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                const Text(
                  "Address",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: BG_COLOR,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                            color: SHADOW_COLOR,
                            offset: Offset(0, 1),
                            blurRadius: 6),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, left: 20, bottom: 20, top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "John Doe",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Street 1305, Au, kerala\nStreet 1305, Au, kerala\nStreet 1305, Au, kerala',
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            Text("Phone:  "),
                            Flexible(
                                child: Text(
                              "0123456789",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text("Total Amount ₹14000",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Cancel order",
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(ERROR_COLOR),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                        side: const BorderSide(color: ERROR_COLOR),
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        )
      ]),
    )));
  }
}
