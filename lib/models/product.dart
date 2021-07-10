import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Product {
  // Product sınıfı için varsayılan constructor.
  // Bu sınıftan bir nesne türetmek için tüm
  // parametreler girilmelidir.
  Product({
    required this.id,
    required this.name,
    required this.photo,
    required this.isGiven,
  });

  // .fromFirestore constructor'ı Firebase Cloud Firestore Database'i
  // üzerinden ürün bilgilerini document olarak çekmek yerine
  // direkt Product nesnesi olarak çekmemizi sağlıyor.
  Product.fromFirestore(Map<String, Object?> product)
      : this(
          id: product["id"] as String,
          name: product["name"] as String,
          photo: product["photo"] as String,
          isGiven: product["isGiven"] as bool,
        );

  // Product sınıfına ait değişkenler.
  final String id;
  final String name;
  final String photo;
  final bool isGiven;

  // toFirestore metodu Product sınıfını
  // Firebase Cloud Firestore Database'e
  // document olarak aktarmamızı sağlıyor.
  Map<String, Object> get toFirestore {
    return {
      "id": id,
      "name": name,
      "photo": photo,
      "isGiven": isGiven,
    };
  }

  // _productsReference, Firebase Cloud Firestore Database
  // üzerindeki "ads" collection'ı icinde bulunan
  // "products" collection'ına erişimi sağlıyor.
  // withConverter metodunu kullanarak da document-nesne
  // değişimini yapmamıza gerek kalmıyor.
  static CollectionReference<Product> _productsReference(
          {required String adId}) =>
      FirebaseFirestore.instance
          .collection("ads")
          .doc(adId)
          .collection("products")
          .withConverter(
            fromFirestore: (snapshot, _) =>
                Product.fromFirestore(snapshot.data()!),
            toFirestore: (Product product, options) => product.toFirestore,
          );

  // createProduct metodu verilen parametrelerle
  // bir ürün oluşturuyor. Bu ürünler tabii ki
  // "ads" collection'undaki belirtilen Id'ye
  // sahip olan document'in içindeki "products"
  // collection'una ekleniyor.
  static Future<String> createProduct({
    required String adId,
    required String name,
    required File photo,
    required bool isGiven,
  }) async {
    try {
      await FirebaseStorage.instance
          .ref(
              "productPhotos/$adId-${isGiven ? "given" : "desired"}ProductPhoto.png")
          .putFile(photo);
      var products = _productsReference(adId: adId);
      var product = products.doc();
      product.set(Product(
        id: product.id,
        name: name,
        photo: await FirebaseStorage.instance
            .ref(
                "productPhotos/$adId-${isGiven ? "given" : "desired"}ProductPhoto.png")
            .getDownloadURL(),
        isGiven: isGiven,
      ));
      return "product created";
    } on FirebaseException catch (e) {
      return e.message!;
    }
  }

  // getProduct metodu parametre olarak aldığı
  // adId ve productId'ye sahip ürünü döndürür.
  static Stream<DocumentSnapshot<Product>> getProduct(
      {required String adId, required String productId}) {
    return _productsReference(adId: adId).doc(productId).snapshots();
  }

  // getProducts database'deki tüm ürünleri döndürür.
  static Stream<QuerySnapshot<Product>> getProducts({required String adId}) {
    return _productsReference(adId: adId).snapshots();
  }

  // getProductsAsFuture database'deki tüm
  // ürünleri Future olarak döndürür.
  static Future<QuerySnapshot<Product>> getProductsAsFuture(
      {required String adId}) {
    return _productsReference(adId: adId).get();
  }
}
