import 'package:firebase_auth/firebase_auth.dart';
import 'package:bhawani_silver/app/data/firebase/firestore/firestore_services.dart';

class AuthenticationHelper{

  FirebaseAuth auth = FirebaseAuth.instance;
  User? currentUser = FirebaseAuth.instance.currentUser;

  Future signUp({required name, required email, required password}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await currentUser!.updateDisplayName(name);
      await currentUser!.updateEmail(email);
      await FireStoreServices.saveUser(name, email, userCredential.user?.uid);

      return null;

    } on FirebaseAuthException catch (e) {
      return e.message;
    }
    }

  Future signIn({required email, required password}) async{
    try {
      final credential =
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return null;

    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signOut() async{
    await auth.signOut();

    return null;
  }

  bool isUserLoggedIN() {
    return currentUser != null;
  }

}