import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  Product({
    required this.id,
    required this.name,
    required this.photo,
    required this.isGiven,
  });

  Product.fromFirestore(Map<String, Object?> product)
      : this(
          id: product["id"] as String,
          name: product["name"] as String,
          photo: product["photo"] as String,
          isGiven: product["isGiven"] as bool,
        );

  final String id;
  final String name;
  final String photo;
  final bool isGiven;

  Map<String, Object> get toFirestore {
    return {
      "id": id,
      "name": name,
      "photo": photo,
      "isGiven": isGiven,
    };
  }

  static CollectionReference<Product> _productsReference({required String adId}) => FirebaseFirestore.instance.collection("ads").doc(adId).collection("products").withConverter(
        fromFirestore: (snapshot, _) => Product.fromFirestore(snapshot.data()!),
        toFirestore: (Product product, options) => product.toFirestore,
      );

  static Stream<QuerySnapshot<Product>> getProducts({required String adId}) {
    return _productsReference(adId: adId).snapshots();
  }
}
