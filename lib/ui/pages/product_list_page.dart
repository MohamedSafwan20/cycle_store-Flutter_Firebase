import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SECONDARY_COLOR,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          "assets/images/logo.jpg",
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(SEARCH_ROUTE),
            icon: const Icon(
              Icons.search_outlined,
              size: 28,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
              size: 28,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () => Get.toNamed(CART_ROUTE),
              icon: const Icon(
                Icons.shopping_bag_outlined,
                size: 28,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    "Results for  ",
                    style: TextStyle(color: SECONDARY_TEXT_COLOR, fontSize: 15),
                  ),
                  Flexible(
                      child: Text(
                    "TR30000",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio:
                            200 / (MediaQuery.of(context).size.width - 130),
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 1),
                    itemBuilder: (_, index) {
                      return const ProductCard();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
