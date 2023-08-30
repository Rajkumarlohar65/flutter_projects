import 'package:flutter/material.dart';
import '../values/app_color.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.darkNavy,
        titleTextStyle: TextStyle(color: AppColor.whiteColor),
        iconTheme: IconThemeData(color: AppColor.whiteColor)
      ),

      // Scaffold Background Color
      scaffoldBackgroundColor: AppColor.backgroundColor, // Set scaffold background color

      // Elevated Button Theme (Customize elevated button appearance)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColor.whiteColor, backgroundColor: AppColor.blueGrey, // Set the text color
        ),
      ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColor.whiteColor,
          unselectedItemColor: AppColor.lightBlack,
          selectedItemColor: AppColor.darkNavy
      ),


      listTileTheme: const ListTileThemeData(
          textColor: AppColor.blackColor
      ),

      // Input Decoration Theme (Customize text field appearance)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColor.whiteColor, // Set text field fill color
        labelStyle: const TextStyle(fontSize: 15, color: AppColor.blueGrey),
        contentPadding: const EdgeInsets.all(12), // Adjust content padding as needed
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColor.blueGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColor.blueGrey),
        ),
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
        unselectedItemColor: Colors.grey,
        selectedItemColor: AppColor.whiteColor
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
        foregroundColor: MaterialStateProperty.all<Color>(AppColor.whiteColor)),
      ),

      // Input Decoration Theme (Customize text field appearance)
      inputDecorationTheme: InputDecorationTheme(
        // labelStyle: const TextStyle(fontSize: 15, color: AppColor.whiteColor),
        contentPadding: const EdgeInsets.all(12), // Adjust content padding as needed
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColor.whiteColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColor.whiteColor),
        ),
      ),

    );
  }
}
