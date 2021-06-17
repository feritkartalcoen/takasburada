import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  Authentication({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

  Stream<User?> get userChanges => firebaseAuth.userChanges();

  User? get user => firebaseAuth.currentUser;

  Future<String> signUp({
    required String name,
    required String surname,
    required String email,
    required String password,
  }) async {
    if (name != "" && surname != "") {
      try {
        UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
        try {
          await firebaseFirestore.collection("users").doc(userCredential.user!.uid).set(({
                "name": name,
                "surname": surname,
                "email": email,
                "password": password,
              }));
          return "signed up";
        } catch (e) {
          return e.toString();
        }
      } on FirebaseAuthException catch (e) {
        return e.message!;
      }
    }
    return "name and surname required";
  }

  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return "signed in";
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
