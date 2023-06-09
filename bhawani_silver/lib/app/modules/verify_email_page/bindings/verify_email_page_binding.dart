import 'package:get/get.dart';

import '../controllers/verify_email_page_controller.dart';

class VerifyEmailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyEmailPageController>(
      () => VerifyEmailPageController(),
    );
  }
}
