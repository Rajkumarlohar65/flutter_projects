import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationHelper{
  Future signUp({required email, required password}) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;

    } on FirebaseAuthException catch (e) {
      return e.message;
    }
    }

  Future login({required email, required password}) async{
    try {
      final credential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return null;

    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signOut() async{
    await FirebaseAuth.instance.signOut();

    return null;
  }

  bool isUserLoggedIN() {
    return FirebaseAuth.instance.currentUser != null;
  }
}