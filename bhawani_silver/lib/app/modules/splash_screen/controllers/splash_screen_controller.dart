import 'dart:async';

import 'package:bhawani_silver/app/data/firebase/Authentication/authentication_helper.dart';
import 'package:bhawani_silver/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 2), () {
      if (AuthenticationHelper().isUserLoggedIN()) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.LOGIN);
      }
    });

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
