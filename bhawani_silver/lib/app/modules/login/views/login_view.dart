import 'package:bhawani_silver/app/routes/app_pages.dart';
import 'package:bhawani_silver/app/widgets/text_form_field/login_email_widget.dart';
import 'package:bhawani_silver/app/widgets/text_form_field/login_password_widget.dart';
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
                  const Text(
                    AppString.loginScreenTitle,
                    style: TextStyle(
                      fontSize: 33,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  const LoginEmailTextFormField(),

                  const SizedBox(
                    height: 20,
                  ),

                  LoginPasswordTextFormField(),

                  Container(
                      padding: const EdgeInsets.only(top: 5),
                      alignment: Alignment.bottomRight,
                      child: const Text(
                        AppString.forgetPasswordButton,
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Obx(() {
                    return controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                controller.loginUser();
                              }
                            },
                            child: const Text(AppString.loginButton),
                          );
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(AppString.loginNewUserText),
                      TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.SIGNUP);
                          },
                          child: const Text(
                            AppString.loginCreateAccountButton,
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          )),
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
