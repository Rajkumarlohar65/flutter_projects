import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../core/utils/utils.dart';
import '../../../data/firebase/firestore/firestore_services.dart';

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
      String? name =  FirebaseAuth.instance.currentUser!.displayName;
      String? email =  FirebaseAuth.instance.currentUser!.email;
      String? uid =  FirebaseAuth.instance.currentUser!.uid;

      await FireStoreServices.saveUser(name: name, email: email, uid: uid);
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
