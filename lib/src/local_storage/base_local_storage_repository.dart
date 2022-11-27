import 'package:gopizza/src/models/product.dart';
import 'package:hive/hive.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseLocalStorageRepository extends ChangeNotifier {
  Future<Box> openBox();
  Future<void> getItems();
  Future<void> addItem(Product product);
  Future<void> removeItem(Product product);
  Future<void> clear();
}
