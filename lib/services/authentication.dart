import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_auth/firebase_auth.dart' as firebase show User;
import 'package:cloud_firestore/cloud_firestore.dart';

class Authentication {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  listenUserChanges() {
    firebaseAuth.userChanges().listen(
      (firebase.User? user) {
        if (user == null) {
          print('User is currently signed out!');
        } else {
          print('User is signed in!');
        }
      },
    );
  }

  Future<firebase.User> signInWithEmailAndPassword(String email, String password) async {
    UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user!;
  }

  Future<void> signOut() async {
    return await firebaseAuth.signOut();
  }

  Future<firebase.User> createUserAndSignInWithEmailAndPassword(String name, String surname, String username, String email, String password) async {
    UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    await firebaseFirestore.collection("users").doc(userCredential.user!.uid).set(({
          "name": name,
          "surname": surname,
          "username": username,
          "email": email,
          "password": password,
        }));
    return userCredential.user!;
  }
}
