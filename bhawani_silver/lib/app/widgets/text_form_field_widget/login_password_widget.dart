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
        obscureText: obscureText.value,
        decoration: InputDecoration(
          labelText: AppString.loginPasswordHint,
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
