import 'package:cycle_store/data/models/product_model.dart';
import 'package:cycle_store/data/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors.dart';

class HomeController extends GetxController {
  RxList<Product> newArrivals = <Product>[].obs;
  RxList<Product> topSelling = <Product>[].obs;
  RxList<String> productsInCart = <String>[].obs;

  RxBool isNewArrivalsLoading = false.obs;
  RxBool isTopSellingLoading = false.obs;
  RxList<String> isCartBtnLoadingList = <String>[].obs;

  @override
  void onInit() {
    getNewArrivedProducts();
    getTopSellingProducts();

    super.onInit();
  }

  void getNewArrivedProducts() {
    isNewArrivalsLoading.value = true;

    ProductService.getNewArrivedProducts().then((res) {
      if (!res["status"]) throw Exception("Failed to get new arrived products");

      newArrivals.value = res["data"];

      isNewArrivalsLoading.value = false;
    }).catchError((e) {
      isNewArrivalsLoading.value = false;
    });
  }

  void getTopSellingProducts() {
    isTopSellingLoading.value = true;

    ProductService.getTopSellingProducts().then((res) {
      if (!res["status"]) throw Exception("Failed to get top selling products");

      topSelling.value = res["data"];

      isTopSellingLoading.value = false;
    }).catchError((e) {
      isTopSellingLoading.value = false;
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
