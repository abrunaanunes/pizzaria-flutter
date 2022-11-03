import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:gopizza/src/models/product.dart';
import 'package:gopizza/src/repositories/pizza_repository.dart'
    as pizza_repository;

class CartRepository extends ChangeNotifier {
  final List<Product> _products = [];

  UnmodifiableListView<Product> get products => UnmodifiableListView(_products);

  saveAll(List<Product> products) {
    products.forEach((product) {
      if (!_products.contains(product)) _products.add(product);
    });
    notifyListeners();
  }
}
