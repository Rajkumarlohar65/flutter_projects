import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../core/utils/utils.dart';
import '../../../data/firebase/firestore/firestore_services.dart';

class VerifyEmailPageController extends GetxController {
  RxBool isEmailVerified = false.obs;
  RxBool canResendEmail = false.obs;
  Timer? timer;

  @override
  void onInit() {
    isEmailVerified.value = FirebaseAuth.instance.currentUser!.emailVerified;
    if(!isEmailVerified.value){
      sendVerificationEmail();
      timer = Timer.periodic(const Duration(seconds: 3), (timer) => checkEmailVerified());
    }
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

      canResendEmail.value = false;
      await Future.delayed(const Duration(seconds: 5));
      canResendEmail.value = true;
    }
    catch(e){
      Utils().showErrorSnackBar("message", e.toString());
    }
  }

  Future checkEmailVerified() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      await currentUser.reload();
      isEmailVerified.value = currentUser.emailVerified;

      if (isEmailVerified.value) {
        String? name = currentUser.displayName;
        String? email = currentUser.email;
        String? uid = currentUser.uid;

        await FireStoreServices.saveUser(name: name, email: email, uid: uid);
        timer!.cancel();
      }
    }
  }

}
