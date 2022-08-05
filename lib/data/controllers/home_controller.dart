import 'package:cycle_store/data/models/product_model.dart';
import 'package:cycle_store/data/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors.dart';

class HomeController extends GetxController {
  RxList<Product> popularProducts = <Product>[].obs;
  RxList popularCarouselImages = [].obs;
  RxList<Product> trendingProducts = <Product>[].obs;
  RxList trendingCarouselImages = [].obs;
  RxList<String> productsInCart = <String>[].obs;

  RxBool isPopularProductsLoading = false.obs;
  RxBool isPopularCarouselLoading = false.obs;
  RxBool isTrendingProductsLoading = false.obs;
  RxBool isTrendingCarouselLoading = false.obs;
  RxList<String> isCartBtnLoadingList = <String>[].obs;

  @override
  void onInit() {
    getPopularCarouselImages();
    getTrendingCarouselImages();
    getPopularProducts();
    getTrendingProducts();

    super.onInit();
  }

  void getPopularCarouselImages() {
    isPopularCarouselLoading.value = true;

    ProductService.getCarouselImages(folder: "POPULAR").then((res) {
      if (!res["status"])
        throw Exception("Failed to get popular carousel images");

      popularCarouselImages.value = res["data"];

      isPopularCarouselLoading.value = false;
    }).catchError((e) {
      isPopularCarouselLoading.value = false;
    });
  }

  void getTrendingCarouselImages() {
    isTrendingCarouselLoading.value = true;

    ProductService.getCarouselImages(folder: "TRENDING").then((res) {
      if (!res["status"])
        throw Exception("Failed to get trending carousel images");

      trendingCarouselImages.value = res["data"];

      isTrendingCarouselLoading.value = false;
    }).catchError((e) {
      isTrendingCarouselLoading.value = false;
    });
  }

  void getPopularProducts() {
    isPopularProductsLoading.value = true;

    ProductService.getPopularProducts().then((res) {
      if (!res["status"]) throw Exception("Failed to get popular products");

      popularProducts.value = res["data"];

      isPopularProductsLoading.value = false;
    }).catchError((e) {
      isPopularProductsLoading.value = false;
    });
  }

  void getTrendingProducts() {
    isTrendingProductsLoading.value = true;

    ProductService.getTrendingProducts().then((res) {
      if (!res["status"]) throw Exception("Failed to get trending products");

      trendingProducts.value = res["data"];

      isTrendingProductsLoading.value = false;
    }).catchError((e) {
      isTrendingProductsLoading.value = false;
    });
  }

  void addToCart({required String productId, required String size}) {
    isCartBtnLoadingList.add(productId);
    ProductService.addToCart(productId: productId, size: size).then((res) {
      isCartBtnLoadingList.remove(productId);

      if (res["status"]) {
        Get.back();
        productsInCart.add(productId);
        update(["cartBtn - $productId"]);
      }
    });
  }

  void removeFromCart(String productId) {
    isCartBtnLoadingList.add(productId);
    ProductService.removeFromCart(productId).then((res) {
      isCartBtnLoadingList.remove(productId);

      if (res["status"]) {
        productsInCart.remove(productId);
        update(["cartBtn - $productId"]);
      }
    });
  }

  void showBottomSheet({required List sizes, required String productId}) {
    showModalBottomSheet(
        context: Get.context!,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        builder: (context) {
          return Container(
            height: 120,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Select size",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: sizes.map((size) {
                    return Row(
                      children: [
                        InkWell(
                          onTap: () {
                            addToCart(productId: productId, size: size);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      color: SHADOW_COLOR,
                                      offset: Offset(1, 1),
                                      blurRadius: 6),
                                ],
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white),
                            height: 36,
                            width: 36,
                            alignment: Alignment.center,
                            child: Text(size,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    );
                  }).toList(),
                )
              ],
            ),
          );
        });
  }
}
