import 'package:gopizza/src/models/price.dart';

class Product {
  String name;
  String imgUrl;
  String description;
  Price price;
  double? _choosedSize;

  Product({
    required this.name,
    required this.imgUrl,
    required this.description,
    required this.price,
    choosedSize = 0.00,
  });

  double get choosedSize => _choosedSize ?? 0.00;
  set choosedSize(value) => _choosedSize = value;
}
