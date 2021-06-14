import 'package:takasburada/classes/product.dart';
import 'package:takasburada/enums/condition.dart';

class Ad {
  String? id;
  String? userId;
  List<Product?>? products;
  DateTime? date;

  Ad({
    this.id,
    this.userId,
    this.products,
    this.date,
  });

  String get title {
    return products!.first!.name! + " - " + products!.last!.name!;
  }

  String get since {
    int dayCount = (DateTime.now().day - this.date!.day);
    return dayCount.toString() +
        " " +
        (dayCount == 1 ? "day" : "days") +
        " ago";
  }
}

List<Ad> ads = [
  Ad(
    id: "0",
    userId: "0",
    products: [
      Product(
        userId: "0",
        name: "mi band 4",
        photo: "images/miBand4.png",
        condition: Condition.used,
        date: DateTime.parse("2012-02-27 13:27:00"),
      ),
      Product(
        name: "iphone 11",
        photo: "images/iPhone11.png",
      ),
    ],
    date: DateTime.parse("2021-06-08 20:18:04"),
  ),
  Ad(
    id: "0",
    userId: "0",
    products: [
      Product(
        userId: "0",
        name: "mi band 4",
        photo: "images/miBand4.png",
        condition: Condition.used,
        date: DateTime.parse("2012-02-27 13:27:00"),
      ),
      Product(
        name: "iphone 11",
        photo: "images/iPhone11.png",
      ),
    ],
    date: DateTime.parse("2021-06-07 20:18:04"),
  ),
  Ad(
    id: "0",
    userId: "1",
    products: [
      Product(
        userId: "1",
        name: "mi band 4",
        photo: "images/miBand4.png",
        condition: Condition.used,
        date: DateTime.parse("2012-02-27 13:27:00"),
      ),
      Product(
        name: "iphone 11",
        photo: "images/iPhone11.png",
      ),
    ],
    date: DateTime.parse("2021-06-06 20:18:04"),
  ),
];
