import 'package:bhawani_silver/app/core/values/app_string.dart';
import 'package:bhawani_silver/app/widgets/button_widget/signup_button_widget.dart';
import 'package:bhawani_silver/app/widgets/button_widget/navigate_signup_to_login_button.dart';
import 'package:bhawani_silver/app/widgets/text_form_field_widget/signup_confirm_password_widget.dart';
import 'package:bhawani_silver/app/widgets/text_form_field_widget/signup_email_widget.dart';
import 'package:bhawani_silver/app/widgets/text_form_field_widget/signup_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.1),
              child: Text(
                AppString.splashAppName,
                style: GoogleFonts.alike(fontSize: 25),
              ),
            ),
            Form(
              key: controller.formKey,
              child: Container(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.05,
                    right: screenWidth * 0.05,
                    left: screenWidth * 0.05,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                        child: const SignUpEmailTextFormField(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                        child: const SignUpPasswordTextFormField(),
                      ),
                      const SignUpConfirmPasswordTextFormField(),
                    ],
                  )),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: double.infinity,
            height: screenHeight * 0.05,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: const SignUpButtonWidget(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(AppString.loginNewUserText),
              NavigateSignUpToLoginButton(),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
