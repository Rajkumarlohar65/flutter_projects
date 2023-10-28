import 'package:BhawaniSilver/app/modules/payment/views/payment_view.dart';
import 'package:get/get.dart';
import '../modules/Tabs/account_tab/account_tab_binding.dart';
import '../modules/Tabs/cart_tab/cart_tab_binding.dart';
import '../modules/Tabs/category_tab/category_tab_binding.dart';
import '../modules/Tabs/home_tab/home_tab_binding.dart';
import '../modules/Tabs/my_orders_tab/my_oders_tab_binding.dart';
import '../modules/address/bindings/address_binding.dart';
import '../modules/address/views/address_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/order_confirmation/bindings/order_confirmation_binding.dart';
import '../modules/order_confirmation/views/order_confirmation_view.dart';
import '../modules/overview_of_product/bindings/overview_of_product_binding.dart';
import '../modules/overview_of_product/views/overview_of_product_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/profile_info/bindings/profile_info_binding.dart';
import '../modules/profile_info/views/profile_info_view.dart';
import '../modules/select_address/bindings/select_address_binding.dart';
import '../modules/select_address/views/select_address_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/verify_email_page/bindings/verify_email_page_binding.dart';
import '../modules/verify_email_page/views/verify_email_page_view.dart';

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
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.OVERVIEW_OF_PRODUCT,
      page: () => const OverviewOfProductView(),
      binding: OverviewOfProductBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_INFO,
      page: () => const ProfileInfoView(),
      binding: ProfileInfoBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_EMAIL_PAGE,
      page: () => const VerifyEmailPageView(),
      binding: VerifyEmailPageBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS,
      page: () => const AddressView(),
      binding: AddressBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_ADDRESS,
      page: () => const SelectAddressView(),
      binding: SelectAddressBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_CONFIRMATION,
      page: () => const OrderConfirmationView(),
      binding: OrderConfirmationBinding(),
    ),
  ];
}
