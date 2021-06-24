import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:takasburada/classes/product.dart';

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
