import 'package:cached_network_image/cached_network_image.dart';
import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/config/typography.dart';
import 'package:cycle_store/data/controllers/my_orders_controller.dart';
import 'package:cycle_store/ui/widgets/custom_app_bar.dart';
import 'package:cycle_store/ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(MyOrdersController());

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Column(
                  children: [
                    const CustomAppBar(
                      title: "My Orders",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => _controller.onTabChange(currentTab: 0),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 19.0, vertical: 8),
                                child: Text(
                                  "Requested",
                                  style: TextStyle(
                                      color: _controller.selectedTab.value == 0
                                          ? Colors.white
                                          : SECONDARY_TEXT_COLOR,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _controller.selectedTab.value == 0
                                      ? PRIMARY_COLOR
                                      : Colors.transparent),
                            ),
                          ),
                          InkWell(
                            onTap: () => _controller.onTabChange(currentTab: 1),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 19.0, vertical: 8),
                                child: Text(
                                  "Delivered",
                                  style: TextStyle(
                                      color: _controller.selectedTab.value == 1
                                          ? Colors.white
                                          : SECONDARY_TEXT_COLOR,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _controller.selectedTab.value == 1
                                      ? PRIMARY_COLOR
                                      : Colors.transparent),
                            ),
                          ),
                          InkWell(
                            onTap: () => _controller.onTabChange(currentTab: 2),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 19.0, vertical: 8),
                                child: Text(
                                  "Cancelled",
                                  style: TextStyle(
                                      color: _controller.selectedTab.value == 2
                                          ? Colors.white
                                          : SECONDARY_TEXT_COLOR,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _controller.selectedTab.value == 2
                                      ? PRIMARY_COLOR
                                      : Colors.transparent),
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Expanded(
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Obx(() {
                        return IndexedStack(
                          index: _controller.selectedTab.value,
                          children: [
                        _controller.isLoading.value
                            ? SizedBox(
                                height:
                                    MediaQuery.of(context).size.height - 160,
                                child: const Loading())
                            : _controller.orders.isEmpty
                                ? SizedBox(
                                    height: MediaQuery.of(context).size.height -
                                        160,
                                    child: Center(
                                      child: Text(
                                        "No orders",
                                        style: HEADING_1.copyWith(
                                            color: SECONDARY_TEXT_COLOR),
                                      ),
                                    ),
                                  )
                                : Column(
                                    children: _controller.orders.map((order) {
                                      return Material(
                                        color: BG_COLOR,
                                        child: InkWell(
                                          onTap: () =>
                                              Get.toNamed(ORDER_SUMMARY_ROUTE),
                                          child: Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0, vertical: 13),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  width: 75,
                                                  height: 75,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: CachedNetworkImage(
                                                      imageUrl: order["product"]
                                                          ["thumbnail"]["url"],
                                                      imageBuilder:
                                                          (_, imageProvider) {
                                                        return Image(
                                                          image: imageProvider,
                                                          fit: BoxFit.fill,
                                                        );
                                                      },
                                                      placeholder:
                                                          (context, value) {
                                                        return const Loading(
                                                            loader:
                                                                LoadingAnimationWidget
                                                                    .beat);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 25,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width -
                                                              180,
                                                      child: Text(
                                                        order["product"]
                                                            ["name"],
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 17),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width -
                                                              180,
                                                      child: Text(
                                                        "${order["size"]} ·  Black Orange",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: const TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                SECONDARY_TEXT_COLOR),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width -
                                                              155,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Flexible(
                                                            child: Text(
                                                              order["price"]
                                                                  .toString(),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 17),
                                                            ),
                                                          ),
                                                          Text(
                                                            "x${order["quantity"]}",
                                                            style: const TextStyle(
                                                                color:
                                                                    SECONDARY_TEXT_COLOR),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                        const Center(
                          child: Text("Delivered"),
                        ),
                        const Center(
                          child: Text("Cancelled"),
                        ),
                      ],
                        );
                      })))
            ])));
  }
}
