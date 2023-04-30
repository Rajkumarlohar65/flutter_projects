import 'package:bhawani_silver/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../core/values/app_color.dart';
import '../../core/values/app_string.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
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
                  controller.loginUser();
                }
              },
              child: const Text(AppString.loginButton),
            );
    });
  }
}
