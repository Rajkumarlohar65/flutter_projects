import 'package:bhawani_silver/app/modules/signup/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/values/app_string.dart';

class SignUpNameTextFormField extends StatelessWidget{
  const SignUpNameTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();
    return TextFormField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: AppString.signUpNameHint,
          prefixIcon: Icon(Icons.account_circle)
      ),
      onChanged: (value){
        controller.name = value;
      },
    );
  }

}