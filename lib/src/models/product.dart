import 'package:gopizza/src/models/price.dart';

class Product {
  String name;
  String imgUrl;
  String description;
  Price price;
  double? choosedSize;

  Product({
    required this.name,
    required this.imgUrl,
    required this.description,
    required this.price,
    this.choosedSize,
  });
}
