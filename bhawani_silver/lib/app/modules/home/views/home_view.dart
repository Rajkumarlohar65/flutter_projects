import 'package:bhawani_silver/app/Authentication/authentication_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        actions: [
          TextButton(onPressed: (){
            AuthenticationHelper().signOut()
                .then((result){
              Get.offAllNamed(Routes.LOGIN);
              Get.snackbar("Activity", "Log out successfully");
            });
          },style: TextButton.styleFrom(foregroundColor: Colors.white), child: const Text("LOG OUT"),),
        ],
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome : ${AuthenticationHelper().userEmail()}",
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
