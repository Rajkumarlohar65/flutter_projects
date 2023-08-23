import 'package:BhawaniSilver/app/core/values/app_string.dart';
import 'package:BhawaniSilver/app/widgets/button_widget/signup_button_widget.dart';
import 'package:BhawaniSilver/app/widgets/button_widget/navigate_signup_to_login_button.dart';
import 'package:BhawaniSilver/app/widgets/text_form_field_widget/signup_confirm_password_widget.dart';
import 'package:BhawaniSilver/app/widgets/text_form_field_widget/signup_email_widget.dart';
import 'package:BhawaniSilver/app/widgets/text_form_field_widget/signup_name_widget.dart';
import 'package:BhawaniSilver/app/widgets/text_form_field_widget/signup_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/signup_controller.dart';

class SignupViewWeb extends GetView<SignupController> {
  const SignupViewWeb({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Center(
          child: SingleChildScrollView(
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
                    width: 400,
                      padding: EdgeInsets.only(
                        top: screenHeight * 0.05,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                            child: const SignUpNameTextFormField(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                            child: const SignUpEmailTextFormField(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                            child: const SignUpPasswordTextFormField(),
                          ),
                          const SignUpConfirmPasswordTextFormField(),

                          SizedBox(height: screenHeight * 0.1,),

                          Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.05),
                                  child: const SizedBox(
                                      width: 300,
                                      height: 40,
                                      child: SignUpButtonWidget()),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(AppString.loginNewUserText),
                                      NavigateSignUpToLoginButton(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
