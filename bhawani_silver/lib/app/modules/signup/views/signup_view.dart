import 'package:BhawaniSilver/app/core/values/app_string.dart';
import 'package:BhawaniSilver/app/modules/signup/views/signup_view_android.dart';
import 'package:BhawaniSilver/app/modules/signup/views/signup_view_web.dart';
import 'package:BhawaniSilver/app/widgets/button_widget/signup_button_widget.dart';
import 'package:BhawaniSilver/app/widgets/button_widget/navigate_signup_to_login_button.dart';
import 'package:BhawaniSilver/app/widgets/text_form_field_widget/signup_confirm_password_widget.dart';
import 'package:BhawaniSilver/app/widgets/text_form_field_widget/signup_email_widget.dart';
import 'package:BhawaniSilver/app/widgets/text_form_field_widget/signup_name_widget.dart';
import 'package:BhawaniSilver/app/widgets/text_form_field_widget/signup_password_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SignupViewAndroid();
  }
}