import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/data/controllers/home_controller.dart';
import 'package:cycle_store/ui/widgets/account.dart';
import 'package:cycle_store/ui/widgets/categories.dart';
import 'package:cycle_store/ui/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                size: 30,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Obx(() {
        return IndexedStack(
          index: controller.currentPageIndex.value,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Home(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Categories(),
            ),
            SizedBox(),
            Account(),
          ],
        );
      }),
      bottomNavigationBar: Obx(() {
        int currentPage = controller.currentPageIndex.value;

        return BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (index) {
            if (index == 2) {
              Get.toNamed(CART_ROUTE);
              return;
            }

            controller.onPageChange(index: index);
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: PRIMARY_COLOR,
          unselectedItemColor: SECONDARY_TEXT_COLOR,
          items: [
            BottomNavigationBarItem(
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.cottage_outlined),
                    currentPage == 0
                        ? Container(
                            width: 5,
                            height: 5,
                            margin: const EdgeInsets.only(top: 2),
                            decoration: const BoxDecoration(
                                color: PRIMARY_COLOR, shape: BoxShape.circle),
                          )
                        : const SizedBox()
                  ],
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.category_outlined),
                    currentPage == 1
                        ? Container(
                            width: 5,
                            height: 5,
                            margin: const EdgeInsets.only(top: 2),
                            decoration: const BoxDecoration(
                                color: PRIMARY_COLOR, shape: BoxShape.circle),
                          )
                        : const SizedBox()
                  ],
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.shopping_bag_outlined),
                    currentPage == 2
                        ? Container(
                            width: 5,
                            height: 5,
                            margin: const EdgeInsets.only(top: 2),
                            decoration: const BoxDecoration(
                                color: PRIMARY_COLOR, shape: BoxShape.circle),
                          )
                        : const SizedBox()
                  ],
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.perm_identity_outlined),
                    currentPage == 3
                        ? Container(
                            width: 5,
                            height: 5,
                            margin: const EdgeInsets.only(top: 2),
                            decoration: const BoxDecoration(
                                color: PRIMARY_COLOR, shape: BoxShape.circle),
                          )
                        : const SizedBox()
                  ],
                ),
                label: ""),
          ],
        );
      }),
    );
  }
}
