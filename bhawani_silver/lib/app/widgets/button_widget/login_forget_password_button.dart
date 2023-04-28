import 'package:flutter/material.dart';

import '../../core/values/app_string.dart';

class LoginForgetPasswordButton extends StatelessWidget{
  const LoginForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {

      }, child: const Text(AppString.forgetPasswordButton,),
    );
  }

}