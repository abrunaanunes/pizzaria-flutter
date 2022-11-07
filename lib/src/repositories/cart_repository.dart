import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:gopizza/src/models/product.dart';

class CartRepository extends ChangeNotifier {
  List<Product> _products = [];
  double _totalPrice = 0.00;

  UnmodifiableListView<Product> get products => UnmodifiableListView(_products);

  addItem(Product product) {
    if (!_products.contains(product)) {
      _products.add(product);
      totalPrice = product.choosedSize;
    }
    notifyListeners();
  }

  double get totalPrice => _totalPrice;
  set totalPrice(double value) => _totalPrice = value;
}
