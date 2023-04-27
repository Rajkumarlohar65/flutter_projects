import 'package:get/get.dart';

import '../../../Authentication/authentication_helper.dart';
import '../../../core/values/app_string.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  late String email;
  late String password;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void loginUser(){
    AuthenticationHelper().signIn(email: email, password: password)
        .then((result) {
      if(result == null){
        Get.offAllNamed(Routes.HOME);
        Get.snackbar(AppString.loginSuccessSnackBarTitle, AppString.loginSuccessSnackBarMessage);
      }
      else{
        Get.snackbar(AppString.loginFailedSnackBarTitle, result);
      }
    });
  }

}
