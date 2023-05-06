import 'package:bhawani_silver/app/modules/signup/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/values/app_string.dart';

class SignUpNameTextFormField extends StatelessWidget {
  const SignUpNameTextFormField({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();
    return TextFormField(
      controller: controller.nameController,
      decoration: const InputDecoration(
          labelText: AppString.signUpNameHint,
          labelStyle: TextStyle(fontSize: 15),
          contentPadding: EdgeInsets.zero,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppString.signUpAlertNameNotNull;
        }
        return null;
      },
      onSaved: (value) {
        controller.name = value;
      },
    );
  }
}
