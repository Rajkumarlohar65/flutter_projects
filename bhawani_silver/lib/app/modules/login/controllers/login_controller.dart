import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/firebase/Authentication/authentication_helper.dart';
import '../../../core/utils/utils.dart';
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

    AuthenticationHelper().signIn(email: email?.trim(), password: password)
        .then((result) {
      if(result == null){
        Get.offAllNamed(Routes.HOME);
        Utils().showSuccessToast(AppString.loginSuccessToastMessage);
        isLoading.value = false;
      }
      else{
        Utils().showErrorSnackBar(AppString.loginFailedSnackBarTitle, result);
        isLoading.value = false;
      }
    });
  }

}
