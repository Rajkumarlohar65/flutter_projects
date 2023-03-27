import 'dart:async';

import 'package:bhawani_silver/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    // Future.delayed(const Duration(seconds: 2), (){Get.offAllNamed(Routes.HOME);});
    Timer(const Duration(seconds: 2), (){Get.offAllNamed(Routes.HOME);});
  }

  @override
  void onClose() {
    super.onClose();
  }

}
