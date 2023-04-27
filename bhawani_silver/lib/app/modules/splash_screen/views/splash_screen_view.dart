import 'package:bhawani_silver/app/core/values/app_string.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(builder: (controller){
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(AppString.splashTitle,style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),),
              Text(
                AppString.splashAppName,
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      );
    });
  }
}
