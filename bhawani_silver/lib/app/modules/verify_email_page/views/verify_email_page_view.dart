import 'package:BhawaniSilver/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/firebase/Authentication/authentication_helper.dart';
import '../../../data/model/userModel.dart';
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
                title: const Text('Verify Email'),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.mail,
                      size: 100,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 24),
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
                    ElevatedButton(
                      onPressed: () {
                        // Resend verification email
                        controller.canResendEmail.value
                            ? controller.sendVerificationEmail()
                            : null;
                      },
                      child: const Text('Resend Verification Email'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          User? currentUser =
                              FirebaseAuth.instance.currentUser;

                          currentUser?.delete();
                          Get.offAllNamed(Routes.LOGIN);
                        },
                        child: const Text('Cancel'))
                  ],
                ),
              ),
            );
          }
        });
  }
}
