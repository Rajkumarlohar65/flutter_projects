import 'package:BhawaniSilver/app/modules/signup/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/values/app_string.dart';

class SignUpPasswordTextFormField extends StatelessWidget {
  const SignUpPasswordTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool obscureText = true.obs;
    final controller = Get.find<SignupController>();

    return Obx(() {
      return TextFormField(
        controller: controller.passwordController,
        obscureText: obscureText.value,
        decoration: InputDecoration(
          labelText: AppString.signUpPasswordHint,
          suffixIcon: IconButton(
              onPressed: () {
                obscureText.toggle();
              },
              icon: Icon(
                  obscureText.value ? Icons.visibility_off : Icons.visibility)),
        ),
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
    });
  }
}
