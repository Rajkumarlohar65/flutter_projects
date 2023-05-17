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

      listTileTheme: const ListTileThemeData(
          textColor: AppColor.blackColor
      ),

    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,

    // AppBar Theme
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(color: Colors.white),
        backgroundColor: AppColor.blackColor
      ),

      scaffoldBackgroundColor: AppColor.blackColor,

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColor.blackColor,
        unselectedItemColor: AppColor.greyColor,
        selectedItemColor: Colors.cyan
      ),

      listTileTheme: const ListTileThemeData(
          // tileColor: AppColor.greyColor,
        textColor: AppColor.whiteColor
      ),

      cardTheme: const CardTheme(
        // color: AppColor.greyColor,
      ),

      dialogBackgroundColor: AppColor.greyColor,

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
        foregroundColor: MaterialStateProperty.all<Color>(AppColor.whiteColor)),
      ),

    );
  }
}
