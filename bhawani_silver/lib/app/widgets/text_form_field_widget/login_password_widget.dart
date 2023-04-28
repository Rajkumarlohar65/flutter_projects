import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/values/app_string.dart';
import '../../modules/login/controllers/login_controller.dart';

class LoginPasswordTextFormField extends StatelessWidget {
  const LoginPasswordTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return TextFormField(
      controller: controller.passwordController,
      obscureText: true,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: AppString.loginPasswordHint,
          prefixIcon: Icon(Icons.password)),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppString.loginAlertPasswordNotNull;
        }
        return null;
      },
      onSaved: (value) {
        controller.password = value;
      },
    );
  }
}
