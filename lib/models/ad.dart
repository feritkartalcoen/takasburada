import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:takasburada/models/product.dart';

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

  static _adsReference() => FirebaseFirestore.instance.collection("ads").orderBy("date", descending: true).withConverter(
        fromFirestore: (snapshot, _) => Ad.fromFirestore(snapshot.data()!),
        toFirestore: (Ad ad, options) => ad.toFirestore,
      );

  String get title {
    return products!.where((product) => product.isGiven == true).single.name + " - " + products!.where((product) => product.isGiven == false).single.name;
  }

  String get since {
    int dayCount = (DateTime.now().day - this.date.toDate().day);
    return dayCount.toString() + " " + (dayCount == 1 ? "day" : "days") + " ago";
  }

  static Stream<QuerySnapshot<Ad>> getAds() {
    return _adsReference().snapshots();
  }
}
