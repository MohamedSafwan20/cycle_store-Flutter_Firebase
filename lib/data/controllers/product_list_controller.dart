import 'package:cycle_store/data/models/product_model.dart';
import 'package:cycle_store/data/services/product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../ui/widgets/sort_product_modal.dart';

class ProductListController extends GetxController {
  String searchText = Get.arguments["searchText"];
  RxList<Product> products = <Product>[].obs;
  RxList<Product> copyProducts = <Product>[].obs;
  RxInt currentPriceSortIndex = 0.obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    switch (searchText.toUpperCase()) {
      case "POPULAR":
        products.value = Get.arguments["products"];
        copyProducts.value = Get.arguments["products"];
        break;
      case "TRENDING":
        products.value = Get.arguments["products"];
        copyProducts.value = Get.arguments["products"];
        break;
      case "ALL":
        products.value = Get.arguments["products"];
        copyProducts.value = Get.arguments["products"];
        break;
      case "MOUNTAIN":
        products.value = Get.arguments["products"];
        copyProducts.value = Get.arguments["products"];
        break;
      case "SPORTS":
        products.value = Get.arguments["products"];
        copyProducts.value = Get.arguments["products"];
        break;
      case "KIDS":
        products.value = Get.arguments["products"];
        copyProducts.value = Get.arguments["products"];
        break;
      case "URBAN":
        products.value = Get.arguments["products"];
        copyProducts.value = Get.arguments["products"];
        break;
      default:
        getProducts();
    }

    super.onInit();
  }

  void getProducts() {
    isLoading.value = true;
    ProductService.getProductsByName(searchText).then((res) {
      if (!res["status"]) throw Exception("Failed to fetch product by name");

      products.value = res["data"];
      copyProducts.value = res["data"];
      isLoading.value = false;
    }).catchError((e) {
      isLoading.value = false;
    });
  }

  void sortProductsPriceFromHighToLow() {
    isLoading.value = true;

    products.sort((first, second) {
      return second.price.compareTo(first.price);
    });

    isLoading.value = false;
  }

  void sortProductsPriceFromLowToHigh() {
    isLoading.value = true;

    products.sort((first, second) {
      return first.price.compareTo(second.price);
    });

    isLoading.value = false;
  }

  void sortProductsPriceRandom() {
    isLoading.value = true;

    products.value = copyProducts;

    isLoading.value = false;
  }

  void onPriceSortChange({required int index}) {
    currentPriceSortIndex.value = index;

    switch (index) {
      case 0:
        sortProductsPriceRandom();
        break;
      case 1:
        sortProductsPriceFromHighToLow();
        break;
      case 2:
        sortProductsPriceFromLowToHigh();
        break;
      default:
        break;
    }

    Get.back();
  }

  void showDialog() {
    Get.defaultDialog(
        title: "Sort By",
        titleStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
        titlePadding: const EdgeInsets.only(top: 15, bottom: 10),
        contentPadding: EdgeInsets.zero,
        radius: 5,
        content: const SortProductsModal());
  }
}
