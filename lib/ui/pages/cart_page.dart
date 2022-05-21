import 'package:cycle_store/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: CustomAppBar(),
            )
          ],
        ),
      ),
    );
  }
}
