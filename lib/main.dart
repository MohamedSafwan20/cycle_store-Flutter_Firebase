import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/firebase_options.dart';
import 'package:cycle_store/ui/pages/add_edit_address.dart';
import 'package:cycle_store/ui/pages/address_page.dart';
import 'package:cycle_store/ui/pages/cart_page.dart';
import 'package:cycle_store/ui/pages/checkout_page.dart';
import 'package:cycle_store/ui/pages/contact_page.dart';
import 'package:cycle_store/ui/pages/email_sent_page.dart';
import 'package:cycle_store/ui/pages/email_verification_page.dart';
import 'package:cycle_store/ui/pages/home_page.dart';
import 'package:cycle_store/ui/pages/login_page.dart';
import 'package:cycle_store/ui/pages/my_orders_page.dart';
import 'package:cycle_store/ui/pages/order_summary_page.dart';
import 'package:cycle_store/ui/pages/product_details_page.dart';
import 'package:cycle_store/ui/pages/product_list_page.dart';
import 'package:cycle_store/ui/pages/profile_page.dart';
import 'package:cycle_store/ui/pages/reset_password_page.dart';
import 'package:cycle_store/ui/pages/search_page.dart';
import 'package:cycle_store/ui/pages/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      initialRoute: SIGNUP_ROUTE,
      getPages: [
        GetPage(name: HOME_ROUTE, page: () => const HomePage()),
        GetPage(name: CART_ROUTE, page: () => const CartPage()),
        GetPage(name: SEARCH_ROUTE, page: () => const SearchPage()),
        GetPage(name: PRODUCT_LIST_ROUTE, page: () => const ProductListPage()),
        GetPage(name: ADDRESS_ROUTE, page: () => const AddressPage()),
        GetPage(name: ADD_EDIT_ROUTE, page: () => const AddEditAddress()),
        GetPage(
            name: PRODUCT_DETAILS_ROUTE,
            page: () => const ProductDetailsPage(),
            transition: Transition.zoom),
        GetPage(name: PROFILE_ROUTE, page: () => const ProfilePage()),
        GetPage(name: MY_ORDERS_ROUTE, page: () => const MyOrdersPage()),
        GetPage(
            name: ORDER_SUMMARY_ROUTE, page: () => const OrderSummaryPage()),
        GetPage(name: CONTACT_ROUTE, page: () => const ContactPage()),
        GetPage(name: CHECKOUT_ROUTE, page: () => const CheckoutPage()),
        GetPage(name: SIGNUP_ROUTE, page: () => const SignupPage()),
        GetPage(name: LOGIN_ROUTE, page: () => const LoginPage()),
        GetPage(
            name: EMAIL_VERIFICATION_ROUTE,
            page: () => const EmailVerificationPage()),
        GetPage(
            name: RESET_PASSWORD_ROUTE, page: () => const ResetPasswordPage()),
        GetPage(name: EMAIL_SENT_ROUTE, page: () => const EmailSentPage()),
      ],
    );
  }
}
