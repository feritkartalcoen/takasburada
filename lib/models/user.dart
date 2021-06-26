import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_auth/firebase_auth.dart' as firebaseUser show User;
import 'package:firebase_storage/firebase_storage.dart';

class User {
  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.photo,
  });

  User.fromFirestore(Map<String, Object?> user)
      : this(
          id: user["id"] as String,
          name: user["name"] as String,
          surname: user["surname"] as String,
          email: user["email"] as String,
          password: user["password"] as String,
          photo: user["photo"] as String,
        );

  final String id;
  final String name;
  final String surname;
  final String email;
  final String password;
  final String photo;

  Map<String, Object> get toFirestore {
    return {
      "id": id,
      "name": name,
      "surname": surname,
      "email": email,
      "password": password,
      "photo": photo,
    };
  }

  static final _usersReference = FirebaseFirestore.instance.collection("users").withConverter<User>(
        fromFirestore: (snapshot, _) => User.fromFirestore(snapshot.data()!),
        toFirestore: (User user, options) => user.toFirestore,
      );

  static Future<String> signUp({required String name, required String surname, required String email, required String password, required File photo}) async {
    if (name != "" && surname != "" && email != "" && password != "" && photo.path != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        try {
          await FirebaseStorage.instance.ref("userPhotos/${userCredential.user!.uid}.png").putFile(photo);
          try {
            var user = _usersReference.doc(userCredential.user!.uid);
            await user.set(
              User(
                id: user.id,
                name: name,
                surname: surname,
                email: email,
                password: password,
                photo: await FirebaseStorage.instance.ref("userPhotos/${userCredential.user!.uid}.png").getDownloadURL(),
              ),
            );
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

  static Future<String> signIn({required String email, required String password}) async {
    if (email != "" && password != "") {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        return "signed in";
      } on FirebaseAuthException catch (e) {
        return e.message!;
      }
    }
    return "please complete all fields";
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static Stream<DocumentSnapshot<User>> getUser({required String userId}) {
    return _usersReference.doc(userId).snapshots();
  }

  static Stream<QuerySnapshot<User>> getUsers() {
    return _usersReference.snapshots();
  }

  static Stream<firebaseUser.User?> get userChanges {
    return FirebaseAuth.instance.userChanges();
  }

  static firebaseUser.User? get currentUser {
    return FirebaseAuth.instance.currentUser!;
  }

  static String get currentUserId {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  String get nameSurname {
    return name + " " + surname;
  }
}
