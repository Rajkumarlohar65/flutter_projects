import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../values/app_color.dart';

class Utils{

  void showErrorSnackBar(String title, String message){
    Get.snackbar(
      title,
      message,
      backgroundColor: AppColor.redColor,
      duration: const Duration(seconds: 2),
      dismissDirection: DismissDirection.horizontal,
    );
  }

  void showSuccessToast(String message){
    Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.TOP,
        backgroundColor: AppColor.greenColor,
    );
  }
}