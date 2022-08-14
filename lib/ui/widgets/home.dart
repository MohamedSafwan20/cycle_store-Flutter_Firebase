import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/data/controllers/home_controller.dart';
import 'package:cycle_store/ui/widgets/brand_products.dart';
import 'package:cycle_store/ui/widgets/custom_carousel.dart';
import 'package:cycle_store/ui/widgets/loading.dart';
import 'package:cycle_store/ui/widgets/popular_products.dart';
import 'package:cycle_store/ui/widgets/search.dart';
import 'package:cycle_store/ui/widgets/trending_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
              return _controller.isLoading.value
                  ? SizedBox(
                      height: 370,
                      child: Loading(),
                    )
                  : Column(
                      children: [
                        GestureDetector(
                            child: _controller.popularCarouselImages.isEmpty
                                ? const SizedBox()
                                : _controller.isPopularCarouselLoading.value
                                    ? SizedBox(
                                        height: 200,
                                        child: Loading(
                                            loader: LoadingAnimationWidget
                                                .prograssiveDots))
                                    : CustomCarousel(
                                        images:
                                            _controller.popularCarouselImages,
                                      ),
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
                              products: _controller.popularProducts),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                            child: _controller.trendingCarouselImages.isEmpty
                                ? const SizedBox()
                                : _controller.isTrendingCarouselLoading.value
                                    ? SizedBox(
                                        height: 200,
                                        child: Loading(
                                            loader: LoadingAnimationWidget
                                                .prograssiveDots))
                                    : CustomCarousel(
                                        images:
                                            _controller.trendingCarouselImages,
                                      ),
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
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ..._controller.brandsData.entries.map(
                          (e) {
                            return e.value["data"].isEmpty
                                ? const SizedBox()
                                : Column(
                                    children: [
                                      GestureDetector(
                                          child: e.value["carousel_images"]
                                                  .isEmpty
                                              ? const SizedBox()
                                              : CustomCarousel(
                                                  images: e
                                                      .value["carousel_images"],
                                                ),
                                          onTap: () {
                                            Get.toNamed(PRODUCT_LIST_ROUTE,
                                                arguments: {
                                                  "searchText": e.key,
                                                  "products": e.value["data"],
                                                });
                                          }),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: BrandProducts(
                                          products: e.value["data"],
                                          brandName: e.key,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  );
                          },
                        ).toList(),
                        const SizedBox(
                          height: 20,
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
