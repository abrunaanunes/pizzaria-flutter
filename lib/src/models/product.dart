import 'package:gopizza/src/models/price.dart';

class Product {
  String name;
  String imgUrl;
  String description;
  List<Price> price;

  Product(
      {required this.name,
      required this.imgUrl,
      required this.description,
      required this.price});
}
