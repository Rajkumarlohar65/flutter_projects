import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileInfoController extends GetxController {
  RxString username = RxString('');
  RxString email = RxString('');

  @override
  Future<void> onInit() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        username.value = currentUser.displayName ?? '';
        email.value = currentUser.email ?? '';
      } else {
        // Handle the case when user data is not available
        username.value = '';
        email.value = '';
      }
    } catch (e) {
      // Handle the error appropriately (e.g., show an error message, log the error)
      username.value = '';
      email.value = '';
      print('Error occurred while fetching user data: $e');
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
