import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {
  Rx<ThemeMode> themeMode = ThemeMode.light.obs;

  @override
  void onInit() {
    super.onInit();
    readInitialValue();
  }

  void changeThemeMode(ThemeMode newMode) {
    Get.changeThemeMode(newMode);
    themeMode.value = newMode;
    GetStorage().write('selectedValue', newMode.toString()); // Store as String
  }

  void readInitialValue() {
    final storedValue = GetStorage().read('selectedValue');
    if (storedValue != null) {
      themeMode.value = _convertStringToThemeMode(storedValue);
    } else {
      themeMode.value = ThemeMode.light;
    }
  }

  ThemeMode _convertStringToThemeMode(String value) {
    switch (value) {
      case 'ThemeMode.light':
        return ThemeMode.light;
      case 'ThemeMode.dark':
        return ThemeMode.dark;
      case 'ThemeMode.system':
        return ThemeMode.system;
      default:
        return ThemeMode.light;
    }
  }

  void initializeTheme() {
    final box = GetStorage();
    const key = 'key';
    final savedTheme = box.read(key);
    if (savedTheme != null) {
      switch (savedTheme) {
        case 'Light':
          Get.changeThemeMode(ThemeMode.light);
          break;
        case 'Dark':
          Get.changeThemeMode(ThemeMode.dark);
          break;
        case 'System default':
          Get.changeThemeMode(ThemeMode.system);
          break;
      }
    }
  }

}
