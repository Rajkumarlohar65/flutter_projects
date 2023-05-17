import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileInfoController extends GetxController {
  late String username;
  late String email;

  @override
  Future<void> onInit() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        username = currentUser.displayName ?? '';
        email = currentUser.email ?? '';
      } else {
        // Handle the case when user data is not available
        username = '';
        email = '';
      }
    } catch (e) {
      // Handle the error appropriately (e.g., show an error message, log the error)
      username = '';
      email = '';
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
