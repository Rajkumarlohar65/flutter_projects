import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../core/utils/utils.dart';

class VerifyEmailPageController extends GetxController {
  RxBool isEmailVerified = false.obs;
  Timer? timer;

  @override
  void onInit() {
    runVerificationProcess();
  }

  @override
  void onClose() {
    super.onClose();
    timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try{
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    }
    catch(e){
      Utils().showErrorSnackBar("message", e.toString());
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    isEmailVerified.value = FirebaseAuth.instance.currentUser!.emailVerified;

    if(isEmailVerified.value){
      timer!.cancel();
    }
  }

  Future runVerificationProcess() async {
    isEmailVerified.value = FirebaseAuth.instance.currentUser!.emailVerified;
    if(!isEmailVerified.value){
      sendVerificationEmail();
      timer = Timer.periodic(const Duration(seconds: 3), (timer) => checkEmailVerified());
    }
  }
}
