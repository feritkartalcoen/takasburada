import 'package:takasburada/enums/condition.dart';

class Product {
  String? id;
  String? adId;
  String? name;
  String? photo;
  Condition? condition;
  DateTime? date;
  bool? isGiven;

  Product({
    this.id,
    this.adId,
    this.name,
    this.photo,
    this.condition,
    this.date,
    this.isGiven,
  });
}
