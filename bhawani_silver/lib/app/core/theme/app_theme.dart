import 'package:flutter/material.dart';
import '../values/app_color.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.whiteColor,
        titleTextStyle: TextStyle(color: AppColor.blackColor),
        iconTheme: IconThemeData(color: AppColor.blackColor)
      ),

    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(color: Colors.white)
      )

    );
  }
}
