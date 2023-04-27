import 'package:bhawani_silver/app/Authentication/authentication_helper.dart';
import 'package:bhawani_silver/app/core/values/app_color.dart';
import 'package:bhawani_silver/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_string.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final _formKey = GlobalKey<FormState>();

  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(AppString.loginAppbarTitle),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 25, right: 25),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Text(AppString.loginScreenTitle, style: TextStyle(fontSize: 33,),),

                  const SizedBox(height: 40,),

                  TextFormField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: AppString.loginEmailHint,
                        prefixIcon: Icon(Icons.email)
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return AppString.loginAlertEmailNotNull;
                      }
                    },
                    onSaved: (value) {
                      controller.email = value;
                    },
                  ),

                  const SizedBox(height: 20,),

                  TextFormField(
                    controller: controller.passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: AppString.loginPasswordHint,
                        prefixIcon: Icon(Icons.password)
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return AppString.loginAlertPasswordNotNull;
                      }
                    },
                    onSaved: (value) {
                      controller.password = value;
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 5),
                    alignment: Alignment.bottomRight,
                      child: const Text(AppString.forgetPasswordButton,)
                  ),

                  const SizedBox(height: 30,),

                  ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        _formKey.currentState!.save();
                        controller.loginUser();
                      }
                    },
                    child: const Text(AppString.loginButton),
                  ),

                  const SizedBox(height: 20,),


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
      ),
    );

  }

}
