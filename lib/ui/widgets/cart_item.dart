import 'package:cached_network_image/cached_network_image.dart';
import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/data/controllers/cart_controller.dart';
import 'package:cycle_store/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'loading.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {Key? key,
      required this.product,
      required this.size,
      required this.index})
      : super(key: key);

  final Product product;
  final String size;
  final int index;

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<CartController>();

    return Container(
      color: BG_COLOR,
      width: double.infinity,
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            width: 70,
            height: 70,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: product.thumbnail["url"],
                imageBuilder: (_, imageProvider) {
                  return Image(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  );
                },
                placeholder: (context, value) {
                  return const Loading(loader: LoadingAnimationWidget.beat);
                },
              ),
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 180,
                child: Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 180,
                child: Text(
                  "$size ·  Black Orange",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 14, color: SECONDARY_TEXT_COLOR),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      "₹" + product.price.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 17),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  GetBuilder<CartController>(
                    assignId: true,
                    id: "quantity - ${product.id}",
                    builder: (logic) {
                      return Row(
                        children: [
                          Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1, color: SECONDARY_TEXT_COLOR)),
                              child: IconButton(
                                onPressed: () {
                                  _controller.decreaseQuantity(
                                      productId: product.id, index: index);
                                },
                                padding: EdgeInsets.zero,
                                alignment: Alignment.center,
                                icon: const Icon(Icons.remove_outlined,
                                    size: 17, color: SECONDARY_TEXT_COLOR),
                              )),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            _controller.quantities[index].toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 16),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: PRIMARY_COLOR,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1, color: SECONDARY_TEXT_COLOR)),
                              child: IconButton(
                                onPressed: () {
                                  _controller.increaseQuantity(
                                      productId: product.id, index: index);
                                },
                                padding: EdgeInsets.zero,
                                alignment: Alignment.center,
                                icon: const Icon(Icons.add_outlined,
                                    size: 17, color: Colors.white),
                              )),
                        ],
                      );
                    },
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
