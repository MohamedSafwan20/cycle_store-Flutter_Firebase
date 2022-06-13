import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/config/typography.dart';
import 'package:cycle_store/data/controllers/order_summary_controller.dart';
import 'package:cycle_store/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderSummaryPage extends StatelessWidget {
  const OrderSummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(OrderSummaryController());

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
                    "Order Summary",
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
                          height: 290,
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (_, index) {
                                return TimelineTile(
                                  afterLineStyle: const LineStyle(
                              thickness: 2, color: PRIMARY_COLOR),
                          beforeLineStyle: const LineStyle(
                              thickness: 2, color: PRIMARY_COLOR),
                          indicatorStyle: IndicatorStyle(
                              height: 15,
                              color: PRIMARY_COLOR,
                              width: 15,
                              indicator: index == 0
                                  ? null
                                  : ((_controller.order["status"] ==
                                                      "CONTACTED" ||
                                                  _controller.order["status"] ==
                                                      "DELIVERED") &&
                                              index == 1) &&
                                          _controller.order["status"] !=
                                              "NEW" &&
                                          index == 1
                                      ? null
                                      : (_controller.order["status"] ==
                                                      "DELIVERED" &&
                                                  index == 2) &&
                                              (_controller.order["status"] !=
                                                      "NEW" ||
                                                  _controller.order["status"] !=
                                                      "CONTACTED") &&
                                              index == 2
                                          ? null
                                          : Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: PRIMARY_COLOR,
                                                      width: 2.2),
                                                  shape: BoxShape.circle,
                                                  color: Colors.white))),
                          isFirst: index == 0 ? true : false,
                          isLast: index == 2 ? true : false,
                          endChild: Container(
                            height: (290 / 3),
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                      Text(
                                        index == 0
                                            ? "Order Placed on 25 july"
                                            : index == 1 &&
                                                    (_controller.order[
                                                                "status"] ==
                                                            "CONTACTED" ||
                                                        _controller.order[
                                                                "status"] ==
                                                            "DELIVERED")
                                                ? "Contacted and confirmed"
                                                : index == 1
                                                    ? "Awaiting contact"
                                                    : index == 2 &&
                                                            _controller.order[
                                                                    "status"] ==
                                                                "DELIVERED"
                                                        ? "Delivered"
                                                        : "Not yet delivered",
                                        style: const TextStyle(
                                            fontSize: 12,
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
                        Text(
                          "${_controller.order["customerName"]}",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${_controller.order["customerAddress"]}",
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text("Phone:  "),
                            Flexible(
                                child: Text(
                              "${_controller.order["customerPhone"]}",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text("Total Amount ₹${_controller.order["price"]}",
                            style: const TextStyle(
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
