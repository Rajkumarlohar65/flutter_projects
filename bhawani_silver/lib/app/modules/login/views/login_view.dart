import 'package:bhawani_silver/app/Authentication/authentication_helper.dart';
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
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "E-mail",
                      prefixIcon: Icon(Icons.email)
                  ),
                  onChanged: (value){
                    controller.email = value;
                  },
                ),

                const SizedBox(height: 20,),

                TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password",
                      prefixIcon: Icon(Icons.password)
                  ),
                  onChanged: (value){
                    controller.password = value;
                  },
                ),

                const SizedBox(height: 30,),

                ElevatedButton(
                  onPressed: () {
                    controller.loginUser();
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

}
