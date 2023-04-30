import 'package:flutter/material.dart';
import '../values/app_color.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: AppColor.whiteColor,
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
        appBarTheme: const AppBarTheme(
            color: AppColor.blackColor,
            iconTheme: IconThemeData(color: AppColor.whiteColor)
        ),

        // Scaffold Background
        scaffoldBackgroundColor: AppColor.blackColor,

        // Text Theme
        textTheme: ThemeData.dark().textTheme.apply(
            bodyColor: AppColor.whiteColor,
        ),

        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: AppColor.whiteColor,
          selectionHandleColor: AppColor.whiteColor,
          cursorColor: AppColor.whiteColor,
        ),

        // ListTile
        listTileTheme: const ListTileThemeData(
            textColor: AppColor.whiteColor, iconColor: AppColor.whiteColor
        ),

        // Bottom Navigation Bar
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppColor.blackColor,
            unselectedItemColor: Colors.white
        )
    );
  }
}
