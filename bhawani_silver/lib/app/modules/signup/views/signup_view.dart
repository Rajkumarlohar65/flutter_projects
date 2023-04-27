import 'package:bhawani_silver/app/core/values/app_string.dart';
import 'package:bhawani_silver/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final _formKey = GlobalKey<FormState>();

  SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(AppString.signUpAppbarTitle),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Center(
          child: SingleChildScrollView(
            child:
              Container(
                padding: const EdgeInsets.only(right: 20, left:20),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    const Text(AppString.signUpScreenTitle, style: TextStyle(fontSize: 33),),

                    const SizedBox(height: 30,),

                    TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: AppString.signUpNameHint,
                          prefixIcon: Icon(Icons.account_circle)
                      ),
                      onChanged: (value){
                        controller.name = value;
                      },
                    ),

                    const SizedBox(height: 20,),

                    TextFormField(
                      controller: controller.emailController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: AppString.signUpEmailHint,
                          prefixIcon: Icon(Icons.email)
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return AppString.signUpAlertEmailNotNull;
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
                          labelText: AppString.signUpPasswordHint,
                          prefixIcon: Icon(Icons.password)
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return AppString.signUpAlertPasswordNotNull;
                        }
                      },
                      onSaved: (value) {
                        controller.password = value;
                      },
                    ),

                    const SizedBox(height: 20,),

                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: AppString.signUpConfirmPasswordHint,
                          prefixIcon: Icon(Icons.password)
                      ),
                      onChanged: (value){
                        controller.confirmPassword = value;
                      },
                    ),

                    const SizedBox(height: 30,),

                    ElevatedButton(onPressed: () async {
                      if(_formKey.currentState!.validate()){
                        _formKey.currentState!.save();
                        controller.createAccount();
                      }
                    }, child: const Text(AppString.signUpButton)),

                    const SizedBox(height: 20,),

                    TextButton(onPressed: (){
                      Get.toNamed(Routes.LOGIN);
                    }, child: const Text(AppString.alreadyHaveAccountText, style: TextStyle(decoration: TextDecoration.underline),)
                    ),

                  ],
                ),

              ),
          ),
        ),
      ),
    );
  }

}
