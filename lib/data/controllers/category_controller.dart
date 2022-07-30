import 'package:cycle_store/data/models/product_model.dart';
import 'package:cycle_store/data/services/product_service.dart';
import 'package:cycle_store/ui/widgets/select_category_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxList categories = ["All", "Mountain", "Sports", "Kids", "Urban"].obs;
  RxInt currentCategoryIndex = 0.obs;
  RxList<Product> products = <Product>[].obs;
  RxList<Product> popularProducts = <Product>[].obs;
  RxList<Product> trendingProducts = <Product>[].obs;

  RxBool isLoading = false.obs;

  void onCategoryChange({required int index}) {
    currentCategoryIndex.value = index;

    switch (index) {
      case 0:
        getAllProducts();
        break;
      case 1:
        getProductsByCategory("MOUNTAIN");
        break;
      case 2:
        getProductsByCategory("SPORTS");
        break;
      case 3:
        getProductsByCategory("KIDS");
        break;
      case 4:
        getProductsByCategory("URBAN");
        break;
    }
  }

  void getAllProducts() {
    isLoading.value = true;

    ProductService.getAllProducts().then((value) {
      if (!value["status"]) throw Exception("Couldn't get products");

      products.value = value["data"];

      popularProducts.value = value["data"];
      popularProducts
          .sort((first, second) => second.buyCount.compareTo(first.buyCount));

      trendingProducts.value = products.where((e) => e.isTrending).toList();

      isLoading.value = false;
    }).catchError((e) {
      isLoading.value = false;
    });
  }

  void getProductsByCategory(String category) {
    isLoading.value = true;

    ProductService.getProductsByCategory(category).then((value) {
      if (!value["status"]) {
        throw Exception("Couldn't get products by category");
      }

      products.value = value["data"];

      popularProducts.value = value["data"];
      popularProducts
          .sort((first, second) => second.buyCount.compareTo(first.buyCount));

      trendingProducts.value = products.where((e) => e.isTrending).toList();

      isLoading.value = false;
    }).catchError((e) {
      isLoading.value = false;
    });
  }

  void showDialog() {
    Get.defaultDialog(
        title: "Select Category",
        titleStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
        titlePadding: const EdgeInsets.only(top: 15, bottom: 10),
        contentPadding: EdgeInsets.zero,
        radius: 5,
        content: const SelectCategoryModal());
  }
}
