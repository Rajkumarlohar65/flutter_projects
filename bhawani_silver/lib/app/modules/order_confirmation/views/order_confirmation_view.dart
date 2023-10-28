import 'package:BhawaniSilver/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/order_confirmation_controller.dart';

class OrderConfirmationView extends GetView<OrderConfirmationController> {
  const OrderConfirmationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animations/order_placed.json', // Path to your animation
              height: 300,
              width: 300,
              repeat: false,
              // onLoaded: (composition) {
              //   // Animation is loaded, start playing sound here
              //   controller.playSound();
              // },
            ),
            const SizedBox(height: 20),
            const Text(
              'Order Placed',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Obx(() => Text(
              'Payment id: ${controller.paymentId.value}',
              style: const TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),)

          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: TextButton(
          onPressed: () {
            Get.offAllNamed(
                Routes.HOME);
          },
          child: const Text("Done", style: TextStyle(color: Colors.green,)),
        ),
      ),
    );
  }
}
