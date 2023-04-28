import 'package:bhawani_silver/app/modules/signup/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/values/app_string.dart';

class SignUpConfirmPasswordTextFormField extends StatelessWidget {
  const SignUpConfirmPasswordTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();

    return TextFormField(
      controller: controller.confirmPasswordController,
      obscureText: true,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: AppString.signUpConfirmPasswordHint,
          prefixIcon: Icon(Icons.password)),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppString.signUpAlertPasswordNotNull;
        }
        if (value != controller.passwordController.text) {
          return AppString.signUpAlertPasswordNotMatch;
        }
        return null;
      },
      onSaved: (value) {
        controller.confirmPassword = value;
      },
    );
  }
}
