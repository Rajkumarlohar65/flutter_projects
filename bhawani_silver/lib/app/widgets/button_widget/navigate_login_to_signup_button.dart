import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/values/app_string.dart';
import '../../routes/app_pages.dart';

class NavigateLoginToSignUpButton extends StatelessWidget {
  const NavigateLoginToSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Get.offAndToNamed(Routes.SIGNUP);
        },
        child: const Text(
          AppString.loginCreateAccountButton,
          style: TextStyle(decoration: TextDecoration.underline),
        ));
  }
}
