import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:takasburada/models/product.dart';
import 'package:takasburada/models/user.dart';

class Ad {
  Ad({
    required this.id,
    required this.userId,
    this.products,
    required this.date,
    required this.information,
  });

  Ad.fromFirestore(Map<String, Object?> ad)
      : this(
          id: ad["id"] as String,
          userId: ad["userId"] as String,
          date: ad["date"] as Timestamp,
          information: ad["information"] as String,
        );

  final String id;
  final String userId;
  List<Product>? products;
  final Timestamp date;
  final String information;

  Map<String, Object> get toFirestore {
    return {
      "id": id,
      "userId": userId,
      "date": date,
      "information": information,
    };
  }

  static CollectionReference<Ad> _adsReference() => FirebaseFirestore.instance.collection("ads").withConverter(
        fromFirestore: (snapshot, _) => Ad.fromFirestore(snapshot.data()!),
        toFirestore: (Ad ad, options) => ad.toFirestore,
      );

  static Future<String> createAd({required String givenProductName, required File givenProductPhoto, required String desiredProductName, required File desiredProductPhoto, required String information}) async {
    if (givenProductName != "" && givenProductPhoto.path != "" && desiredProductName != "" && desiredProductPhoto.path != "" && information != "") {
      try {
        var ad = _adsReference().doc();
        try {
          await ad.set(Ad(
            id: ad.id,
            userId: User.currentUserId,
            date: Timestamp.now(),
            information: information,
          ));
          await Product.createProduct(adId: ad.id, name: givenProductName, photo: givenProductPhoto, isGiven: true);
          await Product.createProduct(adId: ad.id, name: desiredProductName, photo: desiredProductPhoto, isGiven: false);
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

  static Stream<DocumentSnapshot<Ad>> getAd({required String adId}) {
    return _adsReference().doc(adId).snapshots();
  }

  static Stream<QuerySnapshot<Ad>> getAds() {
    return _adsReference().orderBy("date", descending: true).snapshots();
  }

  String get title {
    return products!.where((product) => product.isGiven == true).single.name + " - " + products!.where((product) => product.isGiven == false).single.name;
  }

  String get since {
    int dayCount = (DateTime.now().day - this.date.toDate().day);
    int hourCount = (DateTime.now().hour - this.date.toDate().hour);
    int minuteCount = (DateTime.now().minute - this.date.toDate().minute);
    int secondCount = (DateTime.now().second - this.date.toDate().second);
    if (dayCount >= 1) {
      return dayCount.toString() + " " + (dayCount == 1 ? "day" : "days") + " ago";
    } else if (hourCount >= 1) {
      return hourCount.toString() + " " + (hourCount == 1 ? "hour" : "hours") + " ago";
    } else if (minuteCount >= 1) {
      return minuteCount.toString() + " " + (minuteCount == 1 ? "minute" : "minutes") + " ago";
    } else if (secondCount >= 1) {
      return secondCount.toString() + " " + (secondCount == 1 ? "second" : "seconds") + " ago";
    } else {
      return "now";
    }
  }
}
