import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:gopizza/src/models/order.dart';

class OrderRepository extends ChangeNotifier {
  final List<Order> _orders = [];

  UnmodifiableListView<Order> get orders => UnmodifiableListView(_orders);

  saveAll(List<Order> orders) {
    orders.forEach((order) {
      if (!_orders.contains(order)) _orders.add(order);
    });
    notifyListeners();
  }
}
