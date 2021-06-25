import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
        toFirestore: (user, options) => user.toFirestore,
      );

  String get nameSurname {
    return name + " " + surname;
  }

  static String get currentUserId {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  static Stream<QuerySnapshot<User>> getUsers() {
    return _usersReference.snapshots();
  }
}
