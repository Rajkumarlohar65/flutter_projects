import 'dart:ui';
import 'package:BhawaniSilver/app/core/theme/app_theme.dart';
import 'package:BhawaniSilver/app/modules/Tabs/account_tab/account_tab_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
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

  final setTheme = AccountTabController();
  setTheme.loadThemeFromStorage();

  Stripe.publishableKey = 'pk_test_51Nd5I0SArhJ5v6asFYLhXVwPovXheHmTQFbKQN7M0AYkB8lpY3CdN9xEc2zngmodn21y1Ob12jTtnnogRXashsI000NmXUkVwu';

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };


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
