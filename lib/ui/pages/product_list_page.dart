import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/config/typography.dart';
import 'package:cycle_store/data/controllers/product_list_controller.dart';
import 'package:cycle_store/ui/widgets/loading.dart';
import 'package:cycle_store/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(ProductListController());

    return Scaffold(
      backgroundColor: SECONDARY_COLOR,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          "assets/images/logo.jpg",
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => Get.offNamed(SEARCH_ROUTE),
            icon: const Icon(
              Icons.search_outlined,
              size: 28,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () => Get.toNamed(CART_ROUTE),
              icon: const Icon(
                Icons.shopping_bag_outlined,
                size: 28,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Obx(() {
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Results for  ",
                      style:
                          TextStyle(color: SECONDARY_TEXT_COLOR, fontSize: 15),
                    ),
                    Flexible(
                        child: Text(
                      _controller.searchText.toUpperCase() == "NEW_ARRIVALS"
                          ? "New Arrivals"
                          : _controller.searchText.toUpperCase() ==
                                  "TOP_SELLING"
                              ? "Top Selling"
                              : _controller.searchText.capitalize!,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: _controller.isLoading.value
                        ? const Loading()
                        : _controller.products.isNotEmpty
                            ? GridView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: _controller.products.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio:
                                            (MediaQuery.of(context).size.width /
                                                510),
                                        mainAxisSpacing: 8,
                                        crossAxisSpacing: 1),
                                itemBuilder: (_, index) {
                                  return ProductCard(
                                      product: _controller.products[index]);
                                })
                            : Center(
                                child: Text(
                                "Nothing to show",
                                style: HEADING_1.copyWith(
                                    color: SECONDARY_TEXT_COLOR),
                              ))),
              ],
            );
          }),
        ),
      ),
    );
  }
}
