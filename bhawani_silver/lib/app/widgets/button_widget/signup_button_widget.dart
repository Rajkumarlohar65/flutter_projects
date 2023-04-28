import 'package:bhawani_silver/app/modules/signup/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/values/app_string.dart';

class SignUpButtonWidget extends StatelessWidget {
  const SignUpButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();

    return ElevatedButton(
        onPressed: () async {
          if (controller.formKey.currentState!.validate()) {
            controller.formKey.currentState!.save();
            controller.createAccount();
          }
        },
        child: const Text(AppString.signUpButton));
  }
}
