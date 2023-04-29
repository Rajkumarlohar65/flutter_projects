import 'package:bhawani_silver/app/core/values/app_string.dart';
import 'package:bhawani_silver/app/widgets/button_widget/signup_button_widget.dart';
import 'package:bhawani_silver/app/widgets/button_widget/navigate_signup_to_login_button.dart';
import 'package:bhawani_silver/app/widgets/text_form_field_widget/signup_confirm_password_widget.dart';
import 'package:bhawani_silver/app/widgets/text_form_field_widget/signup_email_widget.dart';
import 'package:bhawani_silver/app/widgets/text_form_field_widget/signup_name_widget.dart';
import 'package:bhawani_silver/app/widgets/text_form_field_widget/signup_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppString.signUpScreenTitle,
                    style: TextStyle(fontSize: 33),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SignUpNameTextFormField(),
                  const SizedBox(
                    height: 20,
                  ),
                  const SignUpEmailTextFormField(),
                  const SizedBox(
                    height: 20,
                  ),
                  const SignUpPasswordTextFormField(),
                  const SizedBox(
                    height: 20,
                  ),
                  const SignUpConfirmPasswordTextFormField(),
                  const SizedBox(
                    height: 30,
                  ),
                  Obx(() {
                    return controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : const SignUpButtonWidget();
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  const NavigateSignUpToLoginButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
