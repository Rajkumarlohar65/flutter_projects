import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  static String? _name;
  static String? _email;

  static String? get name {
    if (_name == null) {
      _name = FirebaseAuth.instance.currentUser?.displayName;
    }
    return _name;
  }

  static String? get email {
    if (_email == null) {
      _email = FirebaseAuth.instance.currentUser?.email;
    }
    return _email;
  }

  static void clearData() {
    _name = null;
    _email = null;
  }
}
