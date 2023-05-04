import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {

  Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  void changeThemeMode(ThemeMode newMode) {
    Get.changeThemeMode(newMode);
    themeMode.value = newMode;
  }

}
