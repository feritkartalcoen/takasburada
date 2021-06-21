import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:takasburada/classes/product.dart';
import 'package:takasburada/enums/condition.dart';

class Ad {
  String? id;
  String? userId;
  List<Product?>? products;
  Timestamp? date;
  String? information;

  Ad({
    this.id,
    this.userId,
    this.products,
    this.date,
    this.information,
  });

  String get title {
    return products!.first!.name! + " - " + products!.last!.name!;
  }

  String get since {
    int dayCount = (DateTime.now().day - this.date!.toDate().day);
    return dayCount.toString() + " " + (dayCount == 1 ? "day" : "days") + " ago";
  }
}

List<Ad> ads = [
  Ad(
    id: "ad1",
    userId: "user1",
    products: [
      Product(
        adId: "ad1",
        name: "iphone 11",
        photo: "images/iPhone11.png",
        condition: Condition.used,
        date: DateTime.parse("2012-02-27 13:27:00"),
      ),
      Product(
        name: "xbox one",
        photo: "images/xboxOne.png",
      ),
    ],
    date: Timestamp(10000, 10000),
  ),
  Ad(
    id: "ad2",
    userId: "user2",
    products: [
      Product(
        adId: "ad2",
        name: "mi band 4",
        photo: "images/miBand4.png",
        condition: Condition.used,
        date: DateTime.parse("2012-02-27 13:27:00"),
      ),
      Product(
        name: "mi watch",
        photo: "images/miWatch.png",
      ),
    ],
    date: Timestamp(10000, 10000),
  ),
  Ad(
    id: "ad3",
    userId: "user1",
    products: [
      Product(
        adId: "ad3",
        name: "laptop",
        photo: "images/laptop.png",
        condition: Condition.used,
        date: DateTime.parse("2012-02-27 13:27:00"),
      ),
      Product(
        name: "desktop",
        photo: "images/desktop.png",
      ),
    ],
    date: Timestamp(10000, 10000),
  ),
];
