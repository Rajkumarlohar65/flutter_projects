import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Utils{

  void showErrorSnackBar(String title, String message){
    Get.snackbar(
      title,
      message,
      duration: const Duration(seconds: 2),
      dismissDirection: DismissDirection.horizontal,
    );
  }

  void showSuccessToast(String message){
    Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.BOTTOM,
    );
  }
}