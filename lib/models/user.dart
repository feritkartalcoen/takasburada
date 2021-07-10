import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_storage/firebase_storage.dart';

class User {
  // User sınıfı için varsayılan constructor.
  // Bu sınıftan bir nesne türetmek için tüm
  // parametreler girilmelidir.
  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.photo,
  });

  // .fromFirestore constructor'ı Firebase Cloud Firestore Database'i
  // üzerinden kullanıcı bilgilerini document olarak çekmek yerine
  // direkt User nesnesi olarak çekmemizi sağlıyor.
  User.fromFirestore(Map<String, Object?> user)
      : this(
          id: user["id"] as String,
          name: user["name"] as String,
          surname: user["surname"] as String,
          email: user["email"] as String,
          password: user["password"] as String,
          photo: user["photo"] as String,
        );

  // User sınıfına ait değişkenler.
  final String id;
  final String name;
  final String surname;
  final String email;
  final String password;
  final String photo;

  // toFirestore metodu User sınıfını Firebase Cloud Firestore Database'e
  // document olarak aktarmamızı sağlıyor.
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

  // Eğer bir değişkenin önünde "_" var ise o değişken Dart dilinde private olur.
  // _usersReference, Firebase Cloud Firestore Database üzerindeki
  // "users" collection'ına erişimi sağlıyor.
  // withConverter metodunu kullanarak da document-nesne
  // değişimini yapmamıza gerek kalmıyor.
  static final _usersReference = FirebaseFirestore.instance
      .collection("users")
      .withConverter<User>(
        fromFirestore: (snapshot, _) => User.fromFirestore(snapshot.data()!),
        toFirestore: (User user, options) => user.toFirestore,
      );

  // signUp metodu aldığı parametrelerle Database'de
  // bir kullanıcı oluşturuyor ve o kullanıcının aynı
  // zamanda sisteme giriş yapmasını sağlıyor.
  // Async bir fonksiyon olduğundan geriye Future döndürür.
  // try - catch ile de hata yakalamak fazlasıyla kolaylaşır.
  static Future<String> signUp({
    required String name,
    required String surname,
    required String email,
    required String password,
    required File photo,
  }) async {
    if (name != "" &&
        surname != "" &&
        email != "" &&
        password != "" &&
        photo.path != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        try {
          await FirebaseStorage.instance
              .ref("userPhotos/${userCredential.user!.uid}.png")
              .putFile(photo);
          try {
            var user = _usersReference.doc(userCredential.user!.uid);
            await user.set(
              User(
                id: user.id,
                name: name,
                surname: surname,
                email: email,
                password: password,
                photo: await FirebaseStorage.instance
                    .ref("userPhotos/${userCredential.user!.uid}.png")
                    .getDownloadURL(),
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

  // signIn metodu aldığı parametrelerle eşleşen
  // kullanıcının sisteme giriş yapmasını sağlıyor.
  static Future<String> signIn(
      {required String email, required String password}) async {
    if (email != "" && password != "") {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        return "signed in";
      } on FirebaseAuthException catch (e) {
        return e.message!;
      }
    }
    return "please complete all fields";
  }

  // signOut metodu kullanıcının sistemden
  // çıkış yapmasını sağlıyor.
  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  // getUser metodu parametre olarak aldığı
  // Id'ye sahip kullanıcıyı döndürür.
  static Stream<DocumentSnapshot<User>> getUser({required String userId}) {
    return _usersReference.doc(userId).snapshots();
  }

  // getUsers database'deki tüm kullanıcıları döndürür.
  static Stream<QuerySnapshot<User>> getUsers() {
    return _usersReference.snapshots();
  }

  // bu metod uygulama üzerinde sisteme
  // giriş yapan kullanıcı Id'sini döndürür.
  static String get currentUserId {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  // Nesnedeki name ve surname değişkenlerini
  // alarak "name surname" olarak döndürür.
  String get nameSurname {
    return name + " " + surname;
  }
}
