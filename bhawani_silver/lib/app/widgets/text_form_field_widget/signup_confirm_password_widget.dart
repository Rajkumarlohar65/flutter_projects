import 'package:BhawaniSilver/app/modules/signup/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/values/app_string.dart';

class SignUpConfirmPasswordTextFormField extends StatelessWidget {
  const SignUpConfirmPasswordTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool obscureText = true.obs;
    final controller = Get.find<SignupController>();

    return Obx(() {
      return TextFormField(
        controller: controller.confirmPasswordController,
        obscureText: obscureText.value,
        decoration: InputDecoration(
          labelText: AppString.signUpConfirmPasswordHint,
          suffixIcon: IconButton(
              onPressed: () {
                obscureText.toggle();
              },
              icon: Icon(
                  obscureText.value ? Icons.visibility_off : Icons.visibility)),
          labelStyle: const TextStyle(fontSize: 15),
          contentPadding: EdgeInsets.zero,
        ),
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
    });
  }
}
