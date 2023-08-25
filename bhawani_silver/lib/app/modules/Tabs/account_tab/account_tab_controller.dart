import 'package:BhawaniSilver/app/data/firebase/Authentication/authentication_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AccountTabController extends GetxController {
  RxBool isUserLoggedIn = false.obs;
  Rx<ThemeMode> themeMode = ThemeMode.light.obs;

  void checkCurrentUser() {
    User? currentUser = FirebaseAuth.instance.currentUser;
    isUserLoggedIn.value = currentUser != null;
  }

  @override
  void onInit() {
    super.onInit();
    checkCurrentUser();
    selectedThemeValue();
  }

  void changeThemeMode(ThemeMode newMode) {
    Get.changeThemeMode(newMode);
    themeMode.value = newMode;
    GetStorage().write('selectedThemeMode', newMode.toString()); // Store as String
  }

  void selectedThemeValue() {
    final storedValue = GetStorage().read('selectedThemeMode');
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

  void loadThemeFromStorage() {
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