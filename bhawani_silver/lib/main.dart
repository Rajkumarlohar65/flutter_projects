import 'package:bhawani_silver/app/core/theme/app_theme.dart';
import 'package:bhawani_silver/app/modules/setting/controllers/setting_controller.dart';
import 'package:bhawani_silver/app/widgets/dialog_box_widget/theme_dialog_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();

  final initialTheme = SettingController();
  initialTheme.initializeTheme();

  runApp(
    GetMaterialApp(
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
