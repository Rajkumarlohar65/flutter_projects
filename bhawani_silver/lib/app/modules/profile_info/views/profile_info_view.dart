import 'package:BhawaniSilver/app/modules/profile_info/controllers/profile_info_controller.dart';
import 'package:BhawaniSilver/app/widgets/button_widget/logout_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileInfoView extends GetView<ProfileInfoController> {
  const ProfileInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(children: [
                ListTile(
                  title: const Text('Name'),
                  subtitle: Text(
                    controller.username,
                  ),
                ),
                ListTile(
                  title: const Text('Email'),
                  subtitle: Text(
                    controller.email
                  ),
                ),
              ]),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: LogOutButtonWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
