import 'package:get/get.dart';
import 'account_tab_controller.dart';

class AccountTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountTabController>(
      () => AccountTabController(),
    );
  }
}
