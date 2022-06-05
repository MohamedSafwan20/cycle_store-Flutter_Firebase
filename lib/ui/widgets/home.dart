import 'package:cycle_store/data/controllers/home_controller.dart';
import 'package:cycle_store/ui/widgets/new_arrivals.dart';
import 'package:cycle_store/ui/widgets/search.dart';
import 'package:cycle_store/ui/widgets/top_selling.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(HomeController());

    return Column(
      children: [
        const Search(),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Obx(() {
              return Column(
                children: [
                  NewArrivals(
                      products: _controller.newArrivals,
                      isLoading: _controller.isNewArrivalsLoading.value),
                  const SizedBox(
                    height: 20,
                  ),
                  TopSelling(
                      products: _controller.topSelling,
                      isLoading: _controller.isTopSellingLoading.value),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              );
            }),
          ),
        )
      ],
    );
  }
}
