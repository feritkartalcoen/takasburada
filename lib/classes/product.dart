import 'package:takasburada/enums/condition.dart';

class Product {
  String? id;
  String? userId;
  String? name;
  String? photo;
  Condition? condition;
  DateTime? date;

  Product({
    this.id,
    this.userId,
    this.name,
    this.photo,
    this.condition,
    this.date,
  });
}
