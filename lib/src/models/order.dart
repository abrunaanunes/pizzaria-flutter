import 'package:gopizza/src/models/address.dart';
import 'package:gopizza/src/models/product.dart';
import 'package:gopizza/src/models/user.dart';

class Order {
  int id;
  User user;
  String date;
  List<Product> products;
  Address address;
  double? amount;

  Order({
    required this.id,
    required this.user,
    required this.date,
    required this.products,
    required this.address,
    this.amount,
  });
}
