import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/data/models/product_model.dart';
import 'package:cycle_store/data/services/product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  List<Product> allProducts = <Product>[];
  final searchController = TextEditingController();

  RxList<Product> searchProducts = <Product>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getAllProducts();

    super.onInit();
  }

  @override
  void dispose() {
    searchController.dispose();

    super.dispose();
  }

  void getAllProducts() {
    isLoading.value = true;
    ProductService.getAllProducts().then((res) {
      if (!res["status"]) throw Exception("Failed to fetch products");

      allProducts = res["data"];
      searchProducts.value = res["data"];
      isLoading.value = false;
    }).catchError((e) {
      isLoading.value = false;
    });
  }

  void onSearchValueChange(String value) {
    searchProducts.value = allProducts.where((product) {
      return product.name.toUpperCase().contains(value.toUpperCase()) ||
          product.category.toUpperCase().contains(value.toUpperCase());
    }).toList();
  }

  void clearSearch() {
    searchController.clear();
    searchProducts.value = allProducts;
  }

  void populateSearch(String value) {
    searchController.text = value;
    onSearchValueChange(value);
  }

  void search() {
    if (searchController.text.isNotEmpty) {
      Get.toNamed(PRODUCT_LIST_ROUTE,
          arguments: {"searchText": searchController.text});
    }
  }
}
