import 'package:carousel_slider/carousel_controller.dart';
import 'package:cycle_store/config/constants.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/data/controllers/home_controller.dart';
import 'package:cycle_store/data/models/product_model.dart';
import 'package:cycle_store/data/services/api_service.dart';
import 'package:cycle_store/data/services/product_service.dart';
import 'package:cycle_store/ui/widgets/size_chart_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  final carouselController = CarouselController();
  final product = Get.arguments["product"] as Product;
  TextEditingController pincode = TextEditingController();

  RxList images = [].obs;
  RxInt currentCarouselImage = 0.obs;
  RxString selectedSizeIndex = "".obs;
  RxList<String> productsInCart = <String>[].obs;
  RxString deliveryAvailableStatus = "".obs;
  RxBool isCheckDeliveryLoading = false.obs;
  RxMap sortedSpecs = {}.obs;

  ProductDetailsController() {
    images.value = product.images.map((e) => e["url"]).toList();
    selectedSizeIndex.value = product.sizes[0];
  }

  @override
  void onInit() {
    Get.lazyPut<HomeController>(() => HomeController());

    sortSpecs();

    ProductService.isProductInCart(product.id).then((res) {
      if (res["status"]) {
        productsInCart.add(product.id);
      }
    });

    super.onInit();
  }

  void onCarouselChange(currentIndex, _) =>
      currentCarouselImage.value = currentIndex;

  void onCarouselIndicatorChange(int currentIndex) {
    currentCarouselImage.value = currentIndex;
    carouselController.animateToPage(currentIndex);
  }

  void onSizeChange({required String selectedSize}) =>
      selectedSizeIndex.value = selectedSize;

  void addToCart() {
    // Updating cart button on home's product card
    Get.find<HomeController>()
        .addToCart(productId: product.id, size: selectedSizeIndex.value);

    productsInCart.add(product.id);
  }

  void removeFromCart() {
    // Updating cart button on home's product card
    Get.find<HomeController>().removeFromCart(product.id);

    productsInCart.remove(product.id);
  }

  void handleBuyNowBtn() {
    Get.toNamed(CHECKOUT_ROUTE, arguments: {
      "product": product,
      "sizes": [selectedSizeIndex.value]
    });
  }

  void checkDelivery() {
    deliveryAvailableStatus.value = "";

    if (pincode.text.length != 6) {
      deliveryAvailableStatus.value = "Invalid Pincode";
      return;
    }

    isCheckDeliveryLoading.value = true;
    ApiService.getLocationFromPincode(pincode.text).then((res) {
      if (res["status"]) {
        if (DELIVERY_AVAILABLE_AREAS.contains(res["district"].toUpperCase())) {
          deliveryAvailableStatus.value = "Delivery Available to this Pincode.";
        } else {
          deliveryAvailableStatus.value =
              "Delivery Not Available to this Pincode.";
        }
      } else {
        deliveryAvailableStatus.value =
            "Delivery Not Available to this Pincode.";
      }

      isCheckDeliveryLoading.value = false;
    });
  }

  void sortSpecs() {
    if (product.specs.containsKey("General")) {
      sortedSpecs.addAll({"General": product.specs["General"]});
    }
    if (product.specs.containsKey("Frame")) {
      sortedSpecs.addAll({"Frame": product.specs["Frame"]});
    }
    if (product.specs.containsKey("Brake")) {
      sortedSpecs.addAll({"Brake": product.specs["Brake"]});
    }
    if (product.specs.containsKey("Dimensions")) {
      sortedSpecs.addAll({"Dimensions": product.specs["Dimensions"]});
    }
    if (product.specs.containsKey("Warranty")) {
      sortedSpecs.addAll({"Warranty": product.specs["Warranty"]});
    }
  }

  void showDialog() {
    Get.defaultDialog(
        title: "Size Chart",
        titleStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
        titlePadding: const EdgeInsets.only(top: 15, bottom: 10),
        contentPadding: EdgeInsets.zero,
        radius: 5,
        content: const SizeChartModal());
  }
}
