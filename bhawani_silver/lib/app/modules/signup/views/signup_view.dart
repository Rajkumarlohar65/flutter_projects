import 'package:bhawani_silver/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
      ),
      body: SingleChildScrollView(
        child:

          Container(
            padding: EdgeInsets.only(top: kToolbarHeight, right: 20, left:20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                const SizedBox(height: 30,),

                const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Name",
                      prefixIcon: Icon(Icons.account_circle)
                  ),
                ),

                const SizedBox(height: 20,),

                const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "E-mail",
                      prefixIcon: Icon(Icons.email)
                  ),
                ),

                const SizedBox(height: 20,),

                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password",
                      prefixIcon: Icon(Icons.password)
                  ),
                ),

                const SizedBox(height: 20,),

                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Confirm Password",
                      prefixIcon: Icon(Icons.password)
                  ),
                ),

                const SizedBox(height: 30,),

                ElevatedButton(onPressed: (){

                }, child: const Text("Create Account")),

                const SizedBox(height: 20,),

                TextButton(onPressed: (){
                  Get.toNamed(Routes.LOGIN);
                }, child: const Text("I am already a member", style: TextStyle(decoration: TextDecoration.underline),)
                ),

              ],
            ),

          ),
      ),
    );
  }
}
