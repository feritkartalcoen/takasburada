import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Authentication {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;

  Authentication({
    required this.firebaseAuth,
    required this.firebaseFirestore,
    required this.firebaseStorage,
  });

  Stream<User?> get userChanges => firebaseAuth.userChanges();

  User? get user => firebaseAuth.currentUser;

  Future<String> signUp({
    required String name,
    required String surname,
    required String email,
    required String password,
    required File photo,
  }) async {
    if (name != "" && surname != "" && email != "" && password != "" && photo.path != "") {
      try {
        UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
        try {
          await firebaseFirestore.collection("users").doc(userCredential.user!.uid).set(({
                "name": name,
                "surname": surname,
                "email": email,
                "password": password,
              }));
          try {
            await firebaseStorage.ref("userPhotos/${userCredential.user!.uid}.png").putFile(photo);
            return "signed up";
          } on FirebaseException catch (e) {
            return e.message!;
          }
        } on FirebaseException catch (e) {
          return e.message!;
        }
      } on FirebaseAuthException catch (e) {
        return e.message!;
      }
    }
    return "please complete all fields";
  }

  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    if (email != "" && password != "") {
      try {
        await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
        return "signed in";
      } on FirebaseAuthException catch (e) {
        return e.message!;
      }
    }
    return "please complete all fields";
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<String> get userPhoto async {
    return await firebaseStorage.ref("userPhotos/${firebaseAuth.currentUser!.uid}.png").getDownloadURL();
  }
}
