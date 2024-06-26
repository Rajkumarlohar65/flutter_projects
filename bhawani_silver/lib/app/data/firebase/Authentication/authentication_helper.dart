import 'package:firebase_auth/firebase_auth.dart';
import 'package:BhawaniSilver/app/data/firebase/firestore/firestore_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationHelper {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? currentUser = FirebaseAuth.instance.currentUser;

  Future signUp({required name, required email, required password}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // update the currentUser variable with the newly created user
      currentUser = userCredential.user;

      await currentUser!.updateDisplayName(name);
      await currentUser!.updateEmail(email);

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signIn({required email, required password}) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      currentUser = auth.currentUser;

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signOut() async {
    await auth.signOut();
    return null;
  }

  bool isUserLoggedIN() {
    return currentUser != null;
  }
}
