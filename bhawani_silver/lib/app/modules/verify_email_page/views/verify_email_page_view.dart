import 'package:BhawaniSilver/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/verify_email_page_controller.dart';

class VerifyEmailPageView extends GetView<VerifyEmailPageController> {
  const VerifyEmailPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: controller.isEmailVerified.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data == true) {
            // Navigate to home screen
            Future.delayed(Duration.zero, () {
              Get.offAllNamed(Routes.HOME);
            });
            return Container(); // Placeholder widget, will not be displayed
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Verify Email', style: TextStyle(color: Colors.white),),
                centerTitle: true,
                backgroundColor: Colors.purple,
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/animations/verification_mail_sent.json',
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'Verification Email Sent',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Please check your email and follow the instructions to verify your account.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 24),
                    Obx(
                      () => controller.countdown.value == 0
                          ? ElevatedButton(
                              onPressed: () {
                                // Resend verification email
                                controller.canResendEmail.value
                                    ? controller.sendVerificationEmail()
                                    : null;
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors
                                    .purple, // Set the background color to red
                              ),
                              child: const Text('Resend Verification Email'),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                // Resend verification email
                                controller.canResendEmail.value
                                    ? controller.sendVerificationEmail()
                                    : null;
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (states) {
                                  return Colors.grey;
                                }),
                              ),
                              child: const Text('Resend Verification Email'),
                            ),
                    ),
                    Obx(() => Text(controller.countdown.value == 0
                        ? ''
                        : 'Resend Button active in: ${controller.countdown.value} seconds')),
                    ElevatedButton(
                      onPressed: () {
                        controller.deleteCurrentUser();
                        Get.offAllNamed(Routes.LOGIN);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.purple, // Set the background color to red
                      ),
                      child: const Text('Cancel'),
                    )
                  ],
                ),
              ),
            );
          }
        });
  }
}
