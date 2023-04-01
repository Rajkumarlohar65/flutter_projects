
import 'package:bhawani_silver/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Welcome"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child:
            Container(
              padding: const EdgeInsets.only(right: 20, left:20),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  const Text("Sign Up", style: TextStyle(fontSize: 33, color: Colors.blueGrey),),

                  const SizedBox(height: 30,),

                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Name",
                        prefixIcon: Icon(Icons.account_circle)
                    ),

                  ),

                  const SizedBox(height: 20,),

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
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Password",
                        prefixIcon: Icon(Icons.password)
                    ),

                  ),

                  const SizedBox(height: 20,),

                  TextField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Confirm Password",
                        prefixIcon: Icon(Icons.password)
                    ),

                  ),

                  const SizedBox(height: 30,),

                  ElevatedButton(onPressed: () async {
                    signUp();
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
      ),
    );
  }
  Future<void> signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.offNamed(Routes.HOME);
      Get.snackbar("Welcome", "Account Created Successfully", backgroundColor: Colors.green);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("SignUp Page", "weak password", backgroundColor: Colors.redAccent);
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("SignUp page", "The account already exists for that email.", backgroundColor: Colors.redAccent);
      } else{
        Get.snackbar("Error", "Something went wrong !", backgroundColor: Colors.redAccent);
      }
    } catch (e) {
      print(e);
    }
  }
}
