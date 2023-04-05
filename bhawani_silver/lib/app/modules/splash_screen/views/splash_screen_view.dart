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
              Text("Welcome to,",style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),),
              Text(
                'Bhawani Silver',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      );
    });
  }
}
