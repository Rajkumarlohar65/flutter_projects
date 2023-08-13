import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../routes/app_pages.dart';
import '../controllers/payment_confirmation_controller.dart';

class PaymentConfirmationView extends GetView<PaymentConfirmationController> {
  const PaymentConfirmationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animations/payment_successful.json', // Path to your animation
              height: 300,
              width: 300,
              repeat: false,
              onLoaded: (composition) {
                // Animation is loaded, start playing sound here
                controller.playSound();
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Payment Successful',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Your order has been placed successfully!',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50,),
            ElevatedButton(
              onPressed: () {
                // Navigate to the home screen manually
                Get.toNamed(Routes.HOME); // Replace with the actual home screen
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.green, // Change the text color here
              ),
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}