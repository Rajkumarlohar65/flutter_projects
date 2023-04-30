import 'package:bhawani_silver/app/core/values/app_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../Authentication/authentication_helper.dart';
import '../../../core/utils/utils.dart';
import '../../../routes/app_pages.dart';
class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();

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
        Utils().showSuccessToast(AppString.signUpSuccessToastMessage);
        isLoading.value = false;
      }
      else{
        Utils().showErrorSnackBar(AppString.signUpFailedSnackBarTitle, result);
        isLoading.value = false;
      }
    });
  }
}
