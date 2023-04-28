import 'package:bhawani_silver/app/widgets/button_widget/login_button_widget.dart';
import 'package:bhawani_silver/app/widgets/button_widget/login_forget_password_button.dart';
import 'package:bhawani_silver/app/widgets/button_widget/navigate_login_to_signup_button.dart';
import 'package:bhawani_silver/app/widgets/text_form_field_widget/login_email_widget.dart';
import 'package:bhawani_silver/app/widgets/text_form_field_widget/login_password_widget.dart';
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
      body: Form(
        key: controller.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Text(
                    AppString.loginScreenTitle,
                    style: TextStyle(
                      fontSize: 33,
                    ),
                  ),

                  const SizedBox(height: 40,),

                  const LoginEmailTextFormField(),

                  const SizedBox(height: 20,),

                  const LoginPasswordTextFormField(),

                  Container(
                      alignment: Alignment.bottomRight,
                      child: const LoginForgetPasswordButton(),
                  ),
                  
                  const SizedBox(height: 30,),

                  const LoginButtonWidget(),

                  const SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(AppString.loginNewUserText),
                      NavigateLoginToSignUpButton(),
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
