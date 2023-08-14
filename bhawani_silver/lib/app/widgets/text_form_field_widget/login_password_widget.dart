import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/values/app_string.dart';
import '../../modules/login/controllers/login_controller.dart';

class LoginPasswordTextFormField extends StatelessWidget {
  const LoginPasswordTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool obscureText = true.obs;
    final controller = Get.find<LoginController>();

    return Obx(() {
      return TextFormField(
        controller: controller.passwordController,
        style: const TextStyle(fontSize: 20),
        obscureText: obscureText.value,
        decoration: InputDecoration(
          labelText: AppString.loginPasswordHint,
          labelStyle: const TextStyle(fontSize: 15),
          contentPadding: EdgeInsets.zero,
          suffixIcon: IconButton(
              onPressed: () {
                obscureText.toggle();
              },
              icon: Icon(
                  obscureText.value ? Icons.visibility_off : Icons.visibility)),
        ),
        keyboardType: TextInputType.visiblePassword,
        autofillHints: const [AutofillHints.password],
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
    });
  }
}
