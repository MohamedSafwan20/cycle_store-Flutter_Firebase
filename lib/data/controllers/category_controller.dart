import 'package:cycle_store/data/models/product_model.dart';
import 'package:cycle_store/data/services/product_service.dart';
import 'package:cycle_store/ui/widgets/select_category_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxList categories = ["All", "Mountain", "Sports", "Kids", "Urban"].obs;
  RxInt currentCategoryIndex = 0.obs;
  RxList<Product> popularProducts = <Product>[].obs;
  RxList<Product> trendingProducts = <Product>[].obs;
  RxList carouselImages = [].obs;

  RxBool isLoading = false.obs;
  RxBool isCarouselLoading = false.obs;

  @override
  void onInit() {
    getAllProducts();
    getCarouselImages(category: "ALL");

    super.onInit();
  }

  void onCategoryChange({required int index}) {
    currentCategoryIndex.value = index;

    switch (index) {
      case 0:
        getAllProducts();
        getCarouselImages(category: "ALL");
        break;
      case 1:
        getProductsByCategory("MOUNTAIN");
        getCarouselImages(category: "MOUNTAIN");
        break;
      case 2:
        getProductsByCategory("SPORTS");
        getCarouselImages(category: "SPORTS");
        break;
      case 3:
        getProductsByCategory("KIDS");
        getCarouselImages(category: "KIDS");
        break;
      case 4:
        getProductsByCategory("URBAN");
        getCarouselImages(category: "URBAN");
        break;
    }
  }

  void getCarouselImages({required String category}) async {
    isCarouselLoading.value = true;

    if (category == "ALL") {
      List res = await Future.wait([
        ProductService.getCarouselImages(folder: "POPULAR"),
        ProductService.getCarouselImages(folder: "TRENDING"),
      ]);
      isCarouselLoading.value = false;
      res.forEach((element) {
        carouselImages.addAll(element["data"]);
      });
      return;
    }

    ProductService.getCarouselImages(folder: category).then((res) {
      if (!res["status"]) throw Exception("Failed to get carousel images");

      carouselImages.value = res["data"];

      isCarouselLoading.value = false;
    }).catchError((e) {
      isCarouselLoading.value = false;
    });
  }

  void getAllProducts() {
    isLoading.value = true;

    ProductService.getAllProducts().then((value) {
      if (!value["status"]) throw Exception("Couldn't get products");

      popularProducts.value = value["data"];
      popularProducts
          .sort((first, second) => second.buyCount.compareTo(first.buyCount));

      trendingProducts.value =
          value["data"].where((Product e) => e.isTrending).toList();

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

      popularProducts.value = value["data"];
      popularProducts
          .sort((first, second) => second.buyCount.compareTo(first.buyCount));

      trendingProducts.value =
          value["data"].where((e) => e.isTrending).toList();

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
