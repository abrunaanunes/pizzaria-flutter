import 'package:gopizza/src/models/price.dart';
import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String imgUrl;

  @HiveField(3)
  String description;

  @HiveField(4)
  Price price;

  @HiveField(5)
  double? _choosedSize;

  Product({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.description,
    required this.price,
    choosedSize = 0.00,
  });

  double get choosedSize => _choosedSize ?? 0.00;
  set choosedSize(value) => _choosedSize = value;
}
