
import 'package:bhawani_silver/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3, left: 25, right: 25),
          child: Column(
            children: [

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

              const SizedBox(height: 30,),

              ElevatedButton(onPressed: (){

              }, child: const Text("Login")
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

    );
  }
}
