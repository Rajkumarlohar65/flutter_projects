import 'package:flutter/material.dart';

import '../../data/firebase/Authentication/authentication_helper.dart';
import '../../widgets/button_widget/logout_button_widget.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Account Section",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 50,
            ),
            Text("User name : ${AuthenticationHelper().currentUser!.displayName}"),
            Text("User mail : ${AuthenticationHelper().currentUser!.email}"),
          ],
        ),
      ),
      floatingActionButton: const LogOutButtonWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
