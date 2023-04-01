import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import 'controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        actions: [
          IconButton(onPressed: (){
            signOut();
          }, icon: const Icon(Icons.logout)),
        ],
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
  Future signOut() async{
    await FirebaseAuth.instance.signOut();
    Get.toNamed(Routes.LOGIN);
    Get.snackbar("Activity", "Log out successfully", backgroundColor: Colors.green);
  }
}
