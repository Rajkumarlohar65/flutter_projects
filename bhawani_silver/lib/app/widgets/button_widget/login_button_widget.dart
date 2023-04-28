import 'package:bhawani_silver/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/values/app_string.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return Obx(() {
      return controller.isLoading.value
          ? const CircularProgressIndicator()
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
