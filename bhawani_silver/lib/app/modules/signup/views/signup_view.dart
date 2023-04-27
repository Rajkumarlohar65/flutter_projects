import 'package:bhawani_silver/app/core/values/app_string.dart';
import 'package:bhawani_silver/app/routes/app_pages.dart';
import 'package:bhawani_silver/app/widgets/text_form_field/signup_confirm_password_widget.dart';
import 'package:bhawani_silver/app/widgets/text_form_field/signup_email_widget.dart';
import 'package:bhawani_silver/app/widgets/text_form_field/signup_name_widget.dart';
import 'package:bhawani_silver/app/widgets/text_form_field/signup_password_widget.dart';
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

                    const SignUpNameTextFormField(),

                    const SizedBox(height: 20,),

                    const SignUpEmailTextFormField(),

                    const SizedBox(height: 20,),

                    const SignUpPasswordTextFormField(),

                    const SizedBox(height: 20,),

                    const SignUpConfirmPasswordTextFormField(),

                    const SizedBox(height: 30,),

                    Obx(() {
                      return controller.isLoading.value ?
                      const CircularProgressIndicator() :
                      ElevatedButton(onPressed: () async {
                        if(_formKey.currentState!.validate()){
                          _formKey.currentState!.save();
                          controller.createAccount();
                        }
                      }, child: const Text(AppString.signUpButton));
                    }),


                    const SizedBox(height: 20,),

                    TextButton(onPressed: (){
                      Get.toNamed(Routes.LOGIN);
                    }, child: const Text(
                      AppString.alreadyHaveAccountText, style: TextStyle(decoration: TextDecoration.underline),)
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
