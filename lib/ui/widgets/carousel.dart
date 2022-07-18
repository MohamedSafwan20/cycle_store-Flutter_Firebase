import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/data/controllers/custom_carousel_controller.dart';
import 'package:cycle_store/ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(CustomCarouselController());

    return Obx(() {
      return Stack(
        children: [
          CarouselSlider.builder(
              carouselController: _controller.carouselController,
              options: CarouselOptions(
                onPageChanged: _controller.onCarouselChange,
                height: 200,
                viewportFraction: 1,
                initialPage: 0,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              itemCount: _controller.images.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return CachedNetworkImage(
                  imageUrl: _controller.images[itemIndex],
                  imageBuilder: (_, imageProvider) {
                    return SizedBox(
                      width: double.infinity,
                      child: Image(
                        image: imageProvider,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                  placeholder: (context, value) {
                    return const Loading(loader: LoadingAnimationWidget.beat);
                  },
                );
              }),
          Positioned(
            bottom: 10,
            left: 50,
            right: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _controller.images
                  .asMap()
                  .entries
                  .map((entry) => GestureDetector(
                        onTap: () {
                          _controller.onCarouselIndicatorChange(entry.key);
                        },
                        child: Container(
                          height: 7,
                          width: 7,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: entry.key ==
                                          _controller.currentCarouselImage.value
                                      ? PRIMARY_COLOR
                                      : PRIMARY_TEXT_COLOR),
                              color: entry.key ==
                                      _controller.currentCarouselImage.value
                                  ? PRIMARY_COLOR
                                  : PRIMARY_TEXT_COLOR),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      );
    });
  }
}
