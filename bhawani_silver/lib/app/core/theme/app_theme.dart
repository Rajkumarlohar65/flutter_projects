import 'package:flutter/material.dart';

class AppTheme{

  static ThemeData lightTheme(){
    return ThemeData(
      appBarTheme: const AppBarTheme(color: Colors.white),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData.dark();
  }
}