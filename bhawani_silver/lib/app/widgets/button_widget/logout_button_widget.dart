import 'package:BhawaniSilver/app/data/model/userModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/firebase/Authentication/authentication_helper.dart';
import '../../core/utils/utils.dart';
import '../../core/values/app_string.dart';
import '../../routes/app_pages.dart';

class LogOutButtonWidget extends StatelessWidget {
  const LogOutButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        AuthenticationHelper().signOut().then((result) {
          UserModel.clearData();
          Get.offAllNamed(Routes.HOME);
          Utils().showSuccessToast(AppString.logOutSuccessSnackBarMessage);
        });
      }, child: const Text('LOG OUT'),
    );
  }
}
