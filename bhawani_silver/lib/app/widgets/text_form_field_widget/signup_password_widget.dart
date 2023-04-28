import 'package:bhawani_silver/app/modules/signup/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/values/app_string.dart';

class SignUpPasswordTextFormField extends StatelessWidget {
  const SignUpPasswordTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();

    return TextFormField(
      controller: controller.passwordController,
      obscureText: true,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: AppString.signUpPasswordHint,
          prefixIcon: Icon(Icons.password)),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppString.signUpAlertPasswordNotNull;
        }
        return null;
      },
      onSaved: (value) {
        controller.password = value;
      },
    );
  }
}
