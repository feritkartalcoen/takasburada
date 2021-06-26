import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

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

  static Future<String> createProduct({required String adId, required String name, required File photo, required bool isGiven}) async {
    try {
      await FirebaseStorage.instance.ref("productPhotos/$adId-${isGiven ? "given" : "desired"}ProductPhoto.png").putFile(photo);
      var products = _productsReference(adId: adId);
      var product = products.doc();
      product.set(Product(
        id: product.id,
        name: name,
        photo: await FirebaseStorage.instance.ref("productPhotos/$adId-${isGiven ? "given" : "desired"}ProductPhoto.png").getDownloadURL(),
        isGiven: isGiven,
      ));
      return "product created";
    } on FirebaseException catch (e) {
      return e.message!;
    }
  }

  static Stream<DocumentSnapshot<Product>> getProduct({required String adId, required String productId}) {
    return _productsReference(adId: adId).doc(productId).snapshots();
  }

  static Stream<QuerySnapshot<Product>> getProducts({required String adId}) {
    return _productsReference(adId: adId).snapshots();
  }
}
