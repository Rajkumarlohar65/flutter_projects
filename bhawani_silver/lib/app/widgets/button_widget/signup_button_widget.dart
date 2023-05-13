import 'package:BhawaniSilver/app/modules/signup/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../core/values/app_color.dart';
import '../../core/values/app_string.dart';

class SignUpButtonWidget extends StatelessWidget {
  const SignUpButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();

    return Obx(() {
      return controller.isLoading.value
          ? const SpinKitThreeBounce(
              size: 20,
              color: AppColor.blueColor,
            )
          : ElevatedButton(
              onPressed: () {
                if (controller.formKey.currentState!.validate()) {
                  controller.formKey.currentState!.save();
                  controller.createAccount();
                }
              },
              child: const Text(AppString.signUpButton),
            );
    });
  }
}
