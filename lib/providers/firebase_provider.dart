import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_auth/firebase_auth.dart' as firebaseUser show User;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:takasburada/classes/user.dart';

class FirebaseProvider {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;

  FirebaseProvider({
    required this.firebaseAuth,
    required this.firebaseFirestore,
    required this.firebaseStorage,
  });

  Stream<firebaseUser.User?> get userChanges => firebaseAuth.userChanges();

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
          await firebaseStorage.ref("userPhotos/${userCredential.user!.uid}.png").putFile(photo);
          try {
            await firebaseFirestore.collection("users").doc(userCredential.user!.uid).set(({
                  "name": name,
                  "surname": surname,
                  "email": email,
                  "password": password,
                  "photo": await firebaseStorage.ref("userPhotos/${userCredential.user!.uid}.png").getDownloadURL(),
                }));
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

  Future<User> getUser(String userId) async {
    var user = User();
    CollectionReference users = firebaseFirestore.collection("users");
    await users.doc(userId).get().then(
      (value) {
        Map<String, dynamic> userData = value.data() as Map<String, dynamic>;
        user = User(
          id: value.id,
          name: userData["name"],
          surname: userData["surname"],
          email: userData["email"],
          password: userData["password"],
          photo: userData["photo"],
        );
      },
    );
    return user;
  }
}
