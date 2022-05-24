import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/data/controllers/my_orders_controller.dart';
import 'package:cycle_store/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                        Column(
                          children: [
                            Material(
                              color: BG_COLOR,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 16),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        width: 90,
                                        height: 90,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            "http://picsum.photos/300/300",
                                            fit: BoxFit.fill,
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
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                180,
                                            child: const Text(
                                              "Roadbike S2",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 21),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                180,
                                            child: const Text(
                                              "S ·  Black Orange",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: SECONDARY_TEXT_COLOR),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: const [
                                              SizedBox(
                                                width: 80,
                                                child: Text(
                                                  "₹14000",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 19),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              color: BG_COLOR,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 16),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        width: 90,
                                        height: 90,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            "http://picsum.photos/300/300",
                                            fit: BoxFit.fill,
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
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                180,
                                            child: const Text(
                                              "Roadbike S2",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 21),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                180,
                                            child: const Text(
                                              "S ·  Black Orange",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: SECONDARY_TEXT_COLOR),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: const [
                                              SizedBox(
                                                width: 80,
                                                child: Text(
                                                  "₹14000",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 19),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              color: BG_COLOR,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 16),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        width: 90,
                                        height: 90,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            "http://picsum.photos/300/300",
                                            fit: BoxFit.fill,
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
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                180,
                                            child: const Text(
                                              "Roadbike S2",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 21),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                180,
                                            child: const Text(
                                              "S ·  Black Orange",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: SECONDARY_TEXT_COLOR),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: const [
                                              SizedBox(
                                                width: 80,
                                                child: Text(
                                                  "₹14000",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 19),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
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
