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
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Name",
                        prefixIcon: Icon(Icons.account_circle)
                    ),
                    onChanged: (value){
                      controller.name = value;
                    },
                  ),

                  const SizedBox(height: 20,),

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

                  const SizedBox(height: 20,),

                  TextField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Confirm Password",
                        prefixIcon: Icon(Icons.password)
                    ),
                    onChanged: (value){
                      controller.confirmPassword = value;
                    },
                  ),

                  const SizedBox(height: 30,),

                  ElevatedButton(onPressed: () async {
                    controller.createAccount();
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

}
