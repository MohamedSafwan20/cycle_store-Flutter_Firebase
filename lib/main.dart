import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/ui/pages/address_page.dart';
import 'package:cycle_store/ui/pages/cart_page.dart';
import 'package:cycle_store/ui/pages/home_page.dart';
import 'package:cycle_store/ui/pages/product_list_page.dart';
import 'package:cycle_store/ui/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // fontFamily: "TitilliumWeb",
        primarySwatch: Colors.blue,
      ),
      initialRoute: HOME_ROUTE,
      getPages: [
        GetPage(name: HOME_ROUTE, page: () => const HomePage()),
        GetPage(name: CART_ROUTE, page: () => const CartPage()),
        GetPage(name: SEARCH_ROUTE, page: () => const SearchPage()),
        GetPage(name: PRODUCT_LIST_ROUTE, page: () => const ProductListPage()),
        GetPage(name: ADDRESS_ROUTE, page: () => const AddressPage()),
      ],
    );
  }
}
