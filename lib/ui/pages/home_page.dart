import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/data/controllers/home_page_controller.dart';
import 'package:cycle_store/ui/widgets/account.dart';
import 'package:cycle_store/ui/widgets/categories.dart';
import 'package:cycle_store/ui/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(HomePageController());

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
      ),
      body: Obx(() {
        return IndexedStack(
          index: _controller.currentPageIndex.value,
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
        int currentPage = _controller.currentPageIndex.value;

        return SizedBox(
          height: 55,
          child: BottomNavigationBar(
            currentIndex: currentPage,
            onTap: (index) {
              if (index == 2) {
                Get.toNamed(CART_ROUTE);
                return;
              }

              _controller.onPageChange(index: index);
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
                      const Icon(
                        Icons.cottage_outlined,
                        size: 22,
                      ),
                      currentPage == 0
                          ? Container(
                              width: 3,
                              height: 3,
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
                      const Icon(
                        Icons.category_outlined,
                        size: 22,
                      ),
                      currentPage == 1
                          ? Container(
                              width: 3,
                              height: 3,
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
                      const Icon(
                        Icons.shopping_bag_outlined,
                        size: 22,
                      ),
                      currentPage == 2
                          ? Container(
                              width: 3,
                              height: 3,
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
                      const Icon(
                        Icons.perm_identity_outlined,
                        size: 22,
                      ),
                      currentPage == 3
                          ? Container(
                              width: 3,
                              height: 3,
                              decoration: const BoxDecoration(
                                  color: PRIMARY_COLOR, shape: BoxShape.circle),
                            )
                          : const SizedBox()
                    ],
                  ),
                  label: ""),
            ],
          ),
        );
      }),
    );
  }
}
