import 'package:BhawaniSilver/app/modules/login/views/login_view_android.dart';
import 'package:BhawaniSilver/app/modules/login/views/login_view_web.dart';
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

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return kIsWeb ? const LoginViewWeb() : const LoginViewAndroid();
  }
}
