import 'package:confetti/confetti.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPlacedPage extends StatelessWidget {
  const OrderPlacedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _confettiController = ConfettiController();
    _confettiController.play();

    Future.delayed(
        const Duration(seconds: 1), () => _confettiController.stop());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/order_placed.jpg",
                      width: 200,
                      height: 200,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        const Text(
                          "Order Placed!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        ConfettiWidget(
                          confettiController: _confettiController,
                          shouldLoop: true,
                          blastDirectionality: BlastDirectionality.explosive,
                          numberOfParticles: 100,
                          createParticlePath: (size) {
                            var path = Path();
                            path.addOval(Rect.fromCircle(
                                center: Offset.zero, radius: 3.1));
                            return path;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () => Get.offNamed(MY_ORDERS_ROUTE),
                        child: const Text(
                          "Go to orders",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
