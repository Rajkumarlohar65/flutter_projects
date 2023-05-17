import 'package:BhawaniSilver/app/routes/app_pages.dart';
import 'package:BhawaniSilver/app/widgets/button_widget/logout_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Account Information',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(width: 16),
                    Text(
                      FirebaseAuth.instance.currentUser!.displayName ?? '',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.email),
                    const SizedBox(width: 16),
                    Text(
                      FirebaseAuth.instance.currentUser!.email ?? '',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){
                Get.toNamed(Routes.SETTING);
              }, child: const Text('Settings')),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child:
                SizedBox(width: double.infinity, child: LogOutButtonWidget()),
          ),
        ],
      ),
    );
  }
}
