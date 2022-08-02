import 'package:confetti/confetti.dart';
import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/ui/widgets/primary_ghost_button.dart';
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
                      width: 210,
                      height: 210,
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
                      height: 5,
                    ),
                    const SizedBox(
                        width: 300,
                        child: Text(
                          "Your order is placed. We will call you soon to confirm the order and address.",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: SECONDARY_TEXT_COLOR),
                          textAlign: TextAlign.center,
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    PrimaryGhostButton(
                      text: "Go to My Orders",
                      onPressed: () => Get.offNamed(MY_ORDERS_ROUTE),
                      width: 130,
                      height: 40,
                    )
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
