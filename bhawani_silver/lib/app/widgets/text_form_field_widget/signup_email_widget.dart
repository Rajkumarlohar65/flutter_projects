import 'package:bhawani_silver/app/modules/signup/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/values/app_string.dart';

class SignUpEmailTextFormField extends StatelessWidget {
  const SignUpEmailTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();
    return TextFormField(
      controller: controller.emailController,
      decoration: const InputDecoration(
          labelText: AppString.signUpEmailHint,
          labelStyle: TextStyle(fontSize: 15),
          contentPadding: EdgeInsets.zero,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppString.signUpAlertEmailNotNull;
        }
        return null;
      },
      onSaved: (value) {
        controller.email = value;
      },
    );
  }
}
