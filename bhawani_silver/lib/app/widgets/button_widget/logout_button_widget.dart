import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../data/firebase/Authentication/authentication_helper.dart';
import '../../core/utils/utils.dart';
import '../../core/values/app_string.dart';
import '../../routes/app_pages.dart';

class LogOutButtonWidget extends StatelessWidget {
  const LogOutButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        AuthenticationHelper().signOut().then((result) {
          Get.offAllNamed(Routes.LOGIN);
          Utils().showSuccessToast(AppString.logOutSuccessSnackBarMessage);
        });
      },
      label: const Text(AppString.logOutButton),
      icon: const Icon(Icons.logout),
    );
  }
}
