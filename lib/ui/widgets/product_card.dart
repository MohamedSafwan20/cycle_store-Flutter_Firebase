import 'package:cached_network_image/cached_network_image.dart';
import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/data/controllers/home_controller.dart';
import 'package:cycle_store/data/models/product_model.dart';
import 'package:cycle_store/data/services/product_service.dart';
import 'package:cycle_store/ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<HomeController>(() => HomeController());
    final _controller = Get.find<HomeController>();

    return InkWell(
      onTap: () =>
          Get.toNamed(PRODUCT_DETAILS_ROUTE, arguments: {"product": product}),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.white,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                height: double.maxFinite,
                imageUrl: product.thumbnail['url'],
                imageBuilder: (_, imageProvider) {
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        color: Colors.black.withOpacity(0.25),
                        child: Image(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ));
                },
                placeholder: (context, value) {
                  return const Loading(loader: LoadingAnimationWidget.beat);
                },
              ),
            ),
            Positioned(
              bottom: 10,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: PRIMARY_TEXT_COLOR,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "₹${product.price}",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: PRIMARY_COLOR,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      GetBuilder<HomeController>(
                          assignId: true,
                          id: "cartBtn - ${product.id}",
                          builder: (logic) {
                            return FutureBuilder(
                              future:
                                  ProductService.isProductInCart(product.id),
                              builder: (context, AsyncSnapshot<Map> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return SizedBox(
                                      width: 48,
                                      child: Obx(() {
                                        final isProductInCart = _controller
                                            .productsInCart
                                            .contains(product.id);

                                        return TextButton(
                                          onPressed: () {
                                            if (isProductInCart) {
                                              _controller
                                                  .removeFromCart(product.id);
                                            } else if (snapshot
                                                .data?["status"]) {
                                              _controller
                                                  .removeFromCart(product.id);
                                            } else {
                                              _controller.showBottomSheet(
                                                  sizes: product.sizes,
                                                  productId: product.id);
                                            }
                                          },
                                          child: _controller
                                                  .isCartBtnLoadingList
                                                  .contains(product.id)
                                              ? const Loading(
                                                  width: 20,
                                                  height: 20,
                                                  color: Colors.white,
                                                  loader: LoadingAnimationWidget
                                                      .fallingDot,
                                                )
                                              : isProductInCart
                                                  ? const Icon(Icons.done)
                                                  : snapshot.data?["status"]
                                                      ? const Icon(Icons.done)
                                                      : const Icon(Icons
                                                          .shopping_bag_outlined),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      PRIMARY_COLOR),
                                              shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5))),
                                              foregroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.white)),
                                        );
                                      }));
                                }

                                return SizedBox(
                                  width: 48,
                                  child: TextButton(
                                    onPressed: null,
                                    child: const Loading(
                                      width: 20,
                                      height: 20,
                                      color: Colors.white,
                                      loader: LoadingAnimationWidget.fallingDot,
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                PRIMARY_COLOR),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5))),
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white)),
                                  ),
                                );
                              },
                            );
                          })
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
