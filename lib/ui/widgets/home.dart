import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/data/controllers/home_controller.dart';
import 'package:cycle_store/ui/widgets/custom_carousel.dart';
import 'package:cycle_store/ui/widgets/popular_products.dart';
import 'package:cycle_store/ui/widgets/search.dart';
import 'package:cycle_store/ui/widgets/trending_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(HomeController());

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Search(),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Obx(() {
              return Column(
                children: [
                  GestureDetector(
                      child: const CustomCarousel(),
                      onTap: () {
                        Get.toNamed(PRODUCT_LIST_ROUTE, arguments: {
                          "searchText": "Popular",
                          "products": _controller.popularProducts,
                        });
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: PopularProducts(
                        products: _controller.popularProducts,
                        isLoading: _controller.isPopularProductsLoading.value),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                      child: const CustomCarousel(),
                      onTap: () {
                        Get.toNamed(PRODUCT_LIST_ROUTE, arguments: {
                          "searchText": "Trending",
                          "products": _controller.trendingProducts,
                        });
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TrendingProducts(
                        products: _controller.trendingProducts,
                        isLoading: _controller.isTrendingProductsLoading.value),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              );
            }),
          ),
        )
      ],
    );
  }
}
