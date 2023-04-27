import 'package:bhawani_silver/app/core/values/app_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../Authentication/authentication_helper.dart';
import '../../../routes/app_pages.dart';
class SignupController extends GetxController {
  late String name;
  String? email;
  String? password;
  String? confirmPassword;

  RxBool isLoading = false.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void createAccount(){
    isLoading.value = true;

    AuthenticationHelper().signUp(email: email, password: password)
        .then((result){
      if(result == null){
        Get.offAllNamed(Routes.HOME);
        Get.snackbar(AppString.signUpSuccessSnackBarTitle, AppString.signUpSuccessSnackBarMessage,);
        isLoading.value = false;
      }
      else{
        Get.snackbar(AppString.signUpFailedSnackBarTitle, result);
        isLoading.value = false;
      }
    });
  }
}
