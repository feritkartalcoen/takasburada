import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_auth/firebase_auth.dart' as firebaseUser show User;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:takasburada/models/ad.dart';
import 'package:takasburada/models/conversation.dart';
import 'package:takasburada/models/message.dart';
import 'package:takasburada/models/product.dart';
import 'package:takasburada/models/user.dart';

class FirebaseProvider {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;

  FirebaseProvider({required this.firebaseAuth, required this.firebaseFirestore, required this.firebaseStorage});

  Stream<firebaseUser.User?> get userChanges {
    return firebaseAuth.userChanges();
  }

  Future<String> signUp({required String name, required String surname, required String email, required String password, required File photo}) async {
    if (name != "" && surname != "" && email != "" && password != "" && photo.path != "") {
      try {
        UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
        try {
          await firebaseStorage.ref("userPhotos/${userCredential.user!.uid}.png").putFile(photo);
          try {
            var user = firebaseFirestore.collection("users").doc(userCredential.user!.uid);
            await user.set(({
              "id": user.id,
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

  Future<String> signIn({required String email, required String password}) async {
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

  Future<User?> getUser({required String userId}) async {
    User? user;
    var usersReference = firebaseFirestore.collection("users");
    await usersReference.doc(userId).get().then(
      (userDocument) {
        var userData = userDocument.data();
        user = User(
          id: userData!["id"],
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

  Future<List<User>> getUsers() async {
    List<User> users = [];
    var usersReference = firebaseFirestore.collection("users");
    await usersReference.get().then(
      (usersSnapshot) {
        usersSnapshot.docs.forEach(
          (userDocument) {
            var userData = userDocument.data();
            users.add(
              User(
                id: userData["id"],
                name: userData["name"],
                surname: userData["surname"],
                email: userData["email"],
                password: userData["password"],
                photo: userData["photo"],
              ),
            );
          },
        );
      },
    );
    return users;
  }

  Future<String> createAd({required String givenProductName, required File givenProductPhoto, required String desiredProductName, required File desiredProductPhoto, required String information}) async {
    if (givenProductName != "" && givenProductPhoto.path != "" && desiredProductName != "" && desiredProductPhoto.path != "" && information != "") {
      try {
        var ad = firebaseFirestore.collection("ads").doc();
        await firebaseStorage.ref("productPhotos/${ad.id}-givenProductPhoto.png").putFile(givenProductPhoto);
        await firebaseStorage.ref("productPhotos/${ad.id}-desiredProductPhoto.png").putFile(desiredProductPhoto);
        try {
          await ad.set(({
            "id": ad.id,
            "userId": firebaseAuth.currentUser!.uid,
            "products": [
              {
                "name": givenProductName,
                "photo": await firebaseStorage.ref("productPhotos/${ad.id}-givenProductPhoto.png").getDownloadURL(),
                "isGiven": true,
              },
              {
                "name": desiredProductName,
                "photo": await firebaseStorage.ref("productPhotos/${ad.id}-desiredProductPhoto.png").getDownloadURL(),
                "isGiven": false,
              },
            ],
            "date": Timestamp.now(),
            "information": information,
          }));
          return "ad created";
        } on FirebaseException catch (e) {
          return e.message!;
        }
      } on FirebaseException catch (e) {
        return e.message!;
      }
    }
    return "please complete all fields";
  }

  Future<Ad?> getAd({required String adId}) async {
    Ad? ad;
    var adsReference = firebaseFirestore.collection("ads");
    await adsReference.doc(adId).get().then(
      (adDocument) {
        var adData = adDocument.data();
        List<Product> products = List.castFrom(adData!["products"])
            .map(
              (product) => Product(
                name: product["name"],
                photo: product["photo"],
                isGiven: product["isGiven"],
              ),
            )
            .toList();
        ad = Ad(
          id: adData["id"],
          userId: adData["userId"],
          products: products,
          information: adData["information"],
          date: adData["date"],
        );
      },
    );
    return ad;
  }

  Future<List<Ad>> getAds() async {
    List<Ad> ads = [];
    var adsReference = firebaseFirestore.collection("ads").orderBy("date", descending: true);
    await adsReference.get().then(
      (adsSnapshot) {
        adsSnapshot.docs.forEach(
          (adDocument) {
            var adData = adDocument.data();
            List<Product> products = List.castFrom(adData["products"]).map(
              (product) {
                return Product(
                  name: product["name"],
                  photo: product["photo"],
                  isGiven: product["isGiven"],
                );
              },
            ).toList();
            ads.add(
              Ad(
                id: adDocument.id,
                userId: adData["userId"],
                products: products,
                date: adData["date"],
                information: adData["information"],
              ),
            );
          },
        );
      },
    );
    return ads;
  }

  Future<String> createConversation({required String adId}) async {
    try {
      var ad = await getAd(adId: adId);
      var conversation = firebaseFirestore.collection("conversations").doc("${ad!.userId}-${firebaseAuth.currentUser!.uid}-$adId");
      try {
        await conversation.set(({
          "id": conversation.id,
          "adId": adId,
          "messages": [],
        }));
        return "conversation created";
      } on FirebaseException catch (e) {
        return e.message!;
      }
    } on FirebaseException catch (e) {
      return e.message!;
    }
  }

  Future<List<Conversation>> getConversations() async {
    List<Conversation> conversations = [];
    var conversationsReference = firebaseFirestore.collection("conversations");
    await conversationsReference.get().then(
      (conversationsSnapshot) {
        conversationsSnapshot.docs.forEach(
          (conversationDocument) {
            var conversationData = conversationDocument.data();
            List<Message> messages = List.castFrom(conversationData["messages"]).map(
              (message) {
                return Message(
                  userId: message["userId"],
                  text: message["text"],
                  date: message["date"],
                );
              },
            ).toList();
            conversations.add(
              Conversation(
                id: conversationData["id"],
                adId: conversationData["adId"],
                messages: messages,
              ),
            );
          },
        );
      },
    );
    return conversations.where((conversation) => conversation.id!.contains(firebaseAuth.currentUser!.uid) == true).toList();
  }
}
