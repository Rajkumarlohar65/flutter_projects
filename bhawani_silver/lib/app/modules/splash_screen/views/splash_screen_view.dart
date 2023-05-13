import 'package:BhawaniSilver/app/core/values/app_string.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
            children: [
              Text(AppString.splashTitle,style: GoogleFonts.alike(fontSize: 40),),
              Text(
                AppString.splashAppName,
                style: GoogleFonts.alike(fontSize: 30),
              ),
            ],
          ),
        ),
      );
    });
  }
}
