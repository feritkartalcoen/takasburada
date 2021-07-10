import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:takasburada/models/product.dart';
import 'package:takasburada/models/user.dart';

// Ad (İlan) sınıfı özgün değişkenler dışında
// ekstra olarak bir userId ve bir de products
// değişkenlerine sahiptir.
// userId; "ads" ve "users" collection'larını
// birbirine bağlamamızı sağlar.
// products; "ads" collection'ı içerisindeki
// her bir document'da "products"
// collection'u oluşturur.
// Bu sayede nested collection yani iç içe
// koleksiyon oluşturmuş oluruz.
class Ad {
  // Ad sınıfı için varsayılan constructor.
  // Bu sınıftan bir nesne türetmek için
  // "products" dışında tüm parametreler
  // girilmelidir.
  // Burada "products" collection'ı oluşturulmaz.
  // İlk önce "ads" collection'ı içine bir
  // document oluşturulur. Daha sonra Product
  // sınıfındaki bir metod ile bu oluşturulan
  // document içerisine "products" adında bir
  // colllection oluşturulur.
  Ad({
    required this.id,
    required this.userId,
    this.products,
    required this.date,
    required this.information,
  });

  // .fromFirestore constructor'ı Firebase Cloud Firestore Database'i
  // üzerinden ilan bilgilerini document olarak çekmek yerine
  // direkt Ad nesnesi olarak çekmemizi sağlıyor.
  Ad.fromFirestore(Map<String, Object?> ad)
      : this(
          id: ad["id"] as String,
          userId: ad["userId"] as String,
          date: ad["date"] as Timestamp,
          information: ad["information"] as String,
        );

  // Ad sınıfına ait değişkenler.
  final String id;
  final String userId;
  List<Product>? products;
  final Timestamp date;
  final String information;

  // toFirestore metodu Ad sınıfını Firebase Cloud Firestore Database'e
  // document olarak aktarmamızı sağlıyor.
  Map<String, Object> get toFirestore {
    return {
      "id": id,
      "userId": userId,
      "date": date,
      "information": information,
    };
  }

  // _adsReference, Firebase Cloud Firestore Database üzerindeki
  // "ads" collection'ına erişimi sağlıyor.
  // withConverter metodunu kullanarak da document-nesne
  // değişimini yapmamıza gerek kalmıyor.
  static CollectionReference<Ad> _adsReference() =>
      FirebaseFirestore.instance.collection("ads").withConverter(
            fromFirestore: (snapshot, _) => Ad.fromFirestore(snapshot.data()!),
            toFirestore: (Ad ad, options) => ad.toFirestore,
          );

  // createAd metodu verilen parametrelerle
  // bir ilan oluşturuyor.
  static Future<String> createAd({
    required String givenProductName,
    required File givenProductPhoto,
    required String desiredProductName,
    required File desiredProductPhoto,
    required String information,
  }) async {
    if (givenProductName != "" &&
        givenProductPhoto.path != "" &&
        desiredProductName != "" &&
        desiredProductPhoto.path != "" &&
        information != "") {
      try {
        var ad = _adsReference().doc();
        try {
          await ad.set(Ad(
            id: ad.id,
            userId: User.currentUserId,
            date: Timestamp.now(),
            information: information,
          ));
          await Product.createProduct(
              adId: ad.id,
              name: givenProductName,
              photo: givenProductPhoto,
              isGiven: true);
          await Product.createProduct(
              adId: ad.id,
              name: desiredProductName,
              photo: desiredProductPhoto,
              isGiven: false);
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

  // getAd metodu parametre olarak aldığı
  // Id'ye sahip ilanı döndürür.
  // Snapshot olarak döndürüldüğünde
  // eğer bu document üzerinde bir değişiklik
  // yapılırsa kullanıcı sayfasını yenilemeden
  // bu değişikliği görür. Flutter'da Stream'ler
  // sayesinde nesneler canlı nesnelere
  // dönüştürülür ve asla sabit kalmaz.
  static Stream<DocumentSnapshot<Ad>> getAd({required String adId}) {
    return _adsReference().doc(adId).snapshots();
  }

  // getAds database'deki tüm ilanları döndürür.
  static Stream<QuerySnapshot<Ad>> getAds() {
    return _adsReference().orderBy("date", descending: true).snapshots();
  }

  // getAdsAsFuture database'deki tüm ilanları
  // Future olarak döndürür. Future; Stream'in
  // aksine nesneleri sabit nesne olarak bırakır.
  // Document üzerinde bir değişiklik yapıldığında
  // kullanıcının bunu görmesi için sayfayı
  // yenilemesi gerekir.
  static Future<QuerySnapshot<Ad>> getAdsAsFuture() {
    return _adsReference().orderBy("date", descending: true).get();
  }

  // İlan başlığını "verilen ürün adı -
  // istenilen ürün adı" şeklinde döndürür.
  String get title {
    return products!.where((product) => product.isGiven == true).single.name +
        " - " +
        products!.where((product) => product.isGiven == false).single.name;
  }

  // İlanın tam olarak kaç dakika, saat vs.
  // önce paylaşıldığını döndürür.
  String get since {
    int dayCount = (DateTime.now().day - this.date.toDate().day);
    int hourCount = (DateTime.now().hour - this.date.toDate().hour);
    int minuteCount = (DateTime.now().minute - this.date.toDate().minute);
    int secondCount = (DateTime.now().second - this.date.toDate().second);
    if (dayCount >= 1) {
      return dayCount.toString() +
          " " +
          (dayCount == 1 ? "day" : "days") +
          " ago";
    } else if (hourCount >= 1) {
      return hourCount.toString() +
          " " +
          (hourCount == 1 ? "hour" : "hours") +
          " ago";
    } else if (minuteCount >= 1) {
      return minuteCount.toString() +
          " " +
          (minuteCount == 1 ? "minute" : "minutes") +
          " ago";
    } else if (secondCount >= 1) {
      return secondCount.toString() +
          " " +
          (secondCount == 1 ? "second" : "seconds") +
          " ago";
    } else {
      return "now";
    }
  }
}
