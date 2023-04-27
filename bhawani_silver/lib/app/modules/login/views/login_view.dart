import 'package:bhawani_silver/app/Authentication/authentication_helper.dart';
import 'package:bhawani_silver/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_string.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {

  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(AppString.loginAppbarTitle),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 25, right: 25),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Text(AppString.loginScreenTitle, style: TextStyle(fontSize: 33, color: Colors.blueGrey),),

                const SizedBox(height: 40,),

                TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: AppString.loginEmailHint,
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
                      labelText: AppString.loginPasswordHint,
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
                  child: const Text(AppString.loginButton),
                ),

                const SizedBox(height: 20,),

                TextButton(onPressed: (){

                }, child: const Text(AppString.forgetPasswordButton, style: TextStyle(color: Colors.black),)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(AppString.loginNewUserText),
                    TextButton(onPressed: (){Get.toNamed(Routes.SIGNUP);
                    },child: const Text(AppString.loginCreateAccountButton, style: TextStyle(decoration: TextDecoration.underline),)),
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
