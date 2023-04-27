import 'package:bhawani_silver/app/Authentication/authentication_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/values/app_string.dart';
import '../../routes/app_pages.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Account Section", style: TextStyle(fontSize: 30),),
            const SizedBox(height: 50,),
            Text("User mail : ${AuthenticationHelper().userEmail()}"),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          AuthenticationHelper().signOut().then((result) {
            Get.offAllNamed(Routes.LOGIN);
            Get.snackbar(AppString.logOutSuccessSnackBarTitle, AppString.logOutSuccessSnackBarMessage);
          });
        },
        label: const Text(AppString.logOutButton),
        icon: const Icon(Icons.logout),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}
