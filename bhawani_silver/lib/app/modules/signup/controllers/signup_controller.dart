import 'package:bhawani_silver/app/core/values/app_string.dart';
import 'package:get/get.dart';

import '../../../Authentication/authentication_helper.dart';
import '../../../routes/app_pages.dart';
class SignupController extends GetxController {
  late String name;
  late String email;
  late String password;
  late String confirmPassword;

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

  void createAccount(){
    AuthenticationHelper().signUp(email: email, password: password)
        .then((result){
      if(result == null){
        Get.offAllNamed(Routes.HOME);
        Get.snackbar(AppString.signUpSuccessSnackBarTitle, AppString.signUpSuccessSnackBarMessage,);
      }
      else{
        Get.snackbar(AppString.signUpFailedSnackBarTitle, result);
      }
    });
  }
}
