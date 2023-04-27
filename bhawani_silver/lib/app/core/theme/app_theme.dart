import 'package:flutter/material.dart';

import '../values/app_color.dart';

class AppTheme{

  static ThemeData lightTheme(){
    return ThemeData(
      appBarTheme: const AppBarTheme(color: AppColor.whiteColor),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData.dark();
  }
}