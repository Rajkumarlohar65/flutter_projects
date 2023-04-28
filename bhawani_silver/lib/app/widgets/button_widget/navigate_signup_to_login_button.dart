import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/values/app_string.dart';
import '../../routes/app_pages.dart';

class NavigateSignUpToLoginButton extends StatelessWidget {
  const NavigateSignUpToLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Get.offAllNamed(Routes.LOGIN);
        },
        child: const Text(
          AppString.alreadyHaveAccountText,
          style: TextStyle(decoration: TextDecoration.underline),
        ));
  }
}
