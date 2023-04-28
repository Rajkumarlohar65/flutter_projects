import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../Authentication/authentication_helper.dart';
import '../../../core/values/app_string.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  RxBool isLoading = false.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginUser(){
    isLoading.value = true;
    AuthenticationHelper().signIn(email: email, password: password)
        .then((result) {
      if(result == null){
        Get.offAllNamed(Routes.HOME);
        Get.snackbar(AppString.loginSuccessSnackBarTitle, AppString.loginSuccessSnackBarMessage);
        isLoading.value = false;
      }
      else{
        Get.snackbar(AppString.loginFailedSnackBarTitle, result);
        isLoading.value = false;
      }
    });
  }

}
