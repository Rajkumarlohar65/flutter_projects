import 'dart:async';

import 'package:BhawaniSilver/app/data/firebase/Authentication/authentication_helper.dart';
import 'package:BhawaniSilver/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {

  @override
  void onInit() {
    super.onInit();

    // Future.delayed(const Duration(seconds: 2), () {
    //   if (AuthenticationHelper().isUserLoggedIN()) {
    //     Get.offAllNamed(Routes.HOME);
    //   } else {
    //     Get.offAllNamed(Routes.LOGIN);
    //   }
    // });

    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(Routes.HOME);
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
