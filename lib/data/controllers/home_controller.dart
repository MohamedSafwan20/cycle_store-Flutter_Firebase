import 'package:cycle_store/config/constants.dart';
import 'package:cycle_store/data/models/product_model.dart';
import 'package:cycle_store/data/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors.dart';

class HomeController extends GetxController {
  final List brands = BRANDS;

  RxList<Product> popularProducts = <Product>[].obs;
  RxList popularCarouselImages = [].obs;
  RxList<Product> trendingProducts = <Product>[].obs;
  RxList trendingCarouselImages = [].obs;
  RxList<String> productsInCart = <String>[].obs;
  RxMap brandsData = {}.obs;
  RxList brandsCarouselImages = [].obs;

  RxBool isLoading = false.obs;
  RxList<String> isCartBtnLoadingList = <String>[].obs;
  RxBool isPopularCarouselLoading = false.obs;
  RxBool isTrendingCarouselLoading = false.obs;

  @override
  void onInit() {
    for (String brand in brands) {
      brandsData[brand] = {"data": <Product>[], "carousel_images": []};
    }

    getPopularCarouselImages();
    getTrendingCarouselImages();
    getBrandsCarouselImages();
    getAllProducts();

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

  void getBrandsCarouselImages() async {
    for (String brand in brands) {
      Map res = await ProductService.getCarouselImages(folder: brand);

      if (res["status"]) {
        brandsData[brand]["carousel_images"] = res["data"];
      } else {
        brandsData[brand]["carousel_images"] = [];
      }
    }
    brandsData.refresh();
  }

  void getAllProducts() {
    isLoading.value = true;

    ProductService.getAllProducts().then((res) {
      if (!res["status"]) throw Exception("Failed to get all products");

      getPopularProducts(res["data"]);
      getTrendingProducts(res["data"]);
      getBrandProducts(res["data"]);

      isLoading.value = false;
    }).catchError((e) {
      isLoading.value = false;
    });
  }

  void getPopularProducts(List<Product> data) {
    popularProducts.value = data;
    popularProducts
        .sort((first, second) => second.buyCount.compareTo(first.buyCount));
  }

  void getTrendingProducts(List<Product> data) {
    trendingProducts.value = data.where((Product e) => e.isTrending).toList();
  }

  void getBrandProducts(List<Product> data) {
    data.forEach((Product e) {
      brandsData[e.brand]["data"].add(e);
    });
  }

  void addToCart({required String productId, required String size}) {
    isCartBtnLoadingList.add(productId);
    ProductService.addToCart(productId: productId, size: size).then((res) {
      isCartBtnLoadingList.remove(productId);

      if (res["status"]) {
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
                            Get.back();
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
