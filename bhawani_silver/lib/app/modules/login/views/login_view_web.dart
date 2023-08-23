import 'package:BhawaniSilver/app/widgets/button_widget/login_button_widget.dart';
import 'package:BhawaniSilver/app/widgets/button_widget/login_forget_password_button.dart';
import 'package:BhawaniSilver/app/widgets/button_widget/navigate_login_to_signup_button.dart';
import 'package:BhawaniSilver/app/widgets/text_form_field_widget/login_email_widget.dart';
import 'package:BhawaniSilver/app/widgets/text_form_field_widget/login_password_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/values/app_string.dart';
import '../controllers/login_controller.dart';

class LoginViewWeb extends GetView<LoginController> {
  const LoginViewWeb({Key? key}) : super(key: key);
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
                    child: Center(
                      child: Container(
                        width: 400,
                        padding: EdgeInsets.only(
                          top: screenHeight * 0.05,
                          right: 0.05,
                          left: 0.05,
                        ),
                        child: Column(children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                            child: const LoginEmailTextFormField(),
                          ),
                          const LoginPasswordTextFormField(),
                          Container(
                              padding:
                                  EdgeInsets.only(bottom: screenHeight * 0.1),
                              alignment: Alignment.bottomRight,
                              child: const LoginForgetPasswordButton()),
                          Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.05),
                                  child: const SizedBox(
                                    width: 300,
                                      height: 40,
                                      child: LoginButtonWidget()),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text(AppString.loginNewUserText),
                                      NavigateLoginToSignUpButton(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
