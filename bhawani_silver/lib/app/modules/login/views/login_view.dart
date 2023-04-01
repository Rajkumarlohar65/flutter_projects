
import 'package:bhawani_silver/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Welcome"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 25, right: 25),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Text("Login", style: TextStyle(fontSize: 33, color: Colors.blueGrey),),

                const SizedBox(height: 40,),

                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "E-mail",
                      prefixIcon: Icon(Icons.email)
                  ),
                ),

                const SizedBox(height: 20,),

                TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password",
                      prefixIcon: Icon(Icons.password)
                  ),
                ),

                const SizedBox(height: 30,),

                ElevatedButton(
                  onPressed: () {
                    login();
                  },
                  child: const Text('Login'),
                ),

                const SizedBox(height: 20,),

                TextButton(onPressed: (){

                }, child: const Text("Forget Password?", style: TextStyle(color: Colors.black),)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("I am new user?"),
                    TextButton(onPressed: (){Get.toNamed(Routes.SIGNUP);
                    },child: const Text("sign up", style: TextStyle(decoration: TextDecoration.underline),)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),

    );

  }

  void login() async{
    try {
      final credential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Successful login, go to home page
      Get.offNamed(Routes.HOME);
      Get.snackbar("Welcome", "back", backgroundColor: Colors.green);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'No user found for that email.', backgroundColor: Colors.redAccent);
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Wrong password for that user.', backgroundColor: Colors.redAccent);
      } else{
        Get.snackbar("Error", "Incorrect mail", backgroundColor: Colors.redAccent);
      }
    }
  }
}
