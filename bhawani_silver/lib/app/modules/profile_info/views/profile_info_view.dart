import 'package:BhawaniSilver/app/widgets/button_widget/logout_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileInfoView extends StatelessWidget {
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
                    FirebaseAuth.instance.currentUser!.displayName ?? '',
                  ),
                ),
                ListTile(
                  title: const Text('Email'),
                  subtitle: Text(
                    FirebaseAuth.instance.currentUser!.email ?? '',
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
