import 'package:BhawaniSilver/app/modules/Tabs/my_orders_tab/my_oders_tab_binding.dart';
import 'package:get/get.dart';

import '../modules/Tabs/account_tab/account_tab_binding.dart';
import '../modules/Tabs/cart_tab/cart_tab_binding.dart';
import '../modules/Tabs/category_tab/category_tab_binding.dart';
import '../modules/Tabs/home_tab/home_tab_binding.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/overview_of_product/bindings/overview_of_product_binding.dart';
import '../modules/overview_of_product/views/overview_of_product_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeView(),
        binding: HomeBinding(),
        bindings: [
          HomeTabBinding(),
          CategoryTabBinding(),
          MyOrdersTabBinding(),
          CartTabBinding(),
          AccountTabBinding()
        ]),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.OVERVIEW_OF_PRODUCT,
      page: () => const OverviewOfProductView(),
      binding: OverviewOfProductBinding(),
    ),
  ];
}
