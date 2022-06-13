import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/data/controllers/image_viewer_controller.dart';
import 'package:cycle_store/ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageViewerPage extends StatelessWidget {
  const ImageViewerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(ImageViewerController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          return Column(
            children: [
              Expanded(
                child: PhotoViewGallery.builder(
                  scrollPhysics: const BouncingScrollPhysics(),
                  builder: (BuildContext context, int index) {
                    return PhotoViewGalleryPageOptions(
                      imageProvider: NetworkImage(_controller.images[index]),
                      initialScale: PhotoViewComputedScale.contained * 0.8,
                    );
                  },
                  itemCount: _controller.images.length,
                  loadingBuilder: (context, event) =>
                      const Loading(loader: LoadingAnimationWidget.beat),
                  backgroundDecoration:
                      const BoxDecoration(color: Colors.white),
                  pageController: _controller.carouselController,
                  onPageChanged: _controller.onCarouselChange,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 25),
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _controller.images
                      .asMap()
                      .entries
                      .map((entry) => Container(
                            height: 10,
                            width: 10,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: entry.key ==
                                            _controller
                                                .currentCarouselImage.value
                                        ? PRIMARY_COLOR
                                        : SECONDARY_TEXT_COLOR),
                                color: entry.key ==
                                        _controller.currentCarouselImage.value
                                    ? PRIMARY_COLOR
                                    : Colors.transparent),
                          ))
                      .toList(),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
