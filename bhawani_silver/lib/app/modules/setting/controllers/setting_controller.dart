import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {

  Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  void changeThemeMode(ThemeMode newMode) {
    Get.changeThemeMode(newMode);
    themeMode.value = newMode;
  }

  @override
  void onClose() {
    themeMode = themeMode.value as Rx<ThemeMode>;
    super.onClose();
  }

}
