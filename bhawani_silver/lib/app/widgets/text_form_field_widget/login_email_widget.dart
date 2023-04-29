import 'package:bhawani_silver/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/values/app_string.dart';

class LoginEmailTextFormField extends StatelessWidget {
  const LoginEmailTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return TextFormField(
      controller: controller.emailController,
      style: const TextStyle(
        fontSize: 20,
      ),
      decoration: const InputDecoration(
          labelText: AppString.loginEmailHint,
          labelStyle: TextStyle(fontSize: 15),
          contentPadding: EdgeInsets.zero),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppString.loginAlertEmailNotNull;
        }
        return null;
      },
      onSaved: (value) {
        controller.email = value;
      },
    );
  }
}