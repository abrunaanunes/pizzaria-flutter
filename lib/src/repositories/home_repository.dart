import 'package:gopizza/src/models/product.dart';
import 'package:gopizza/src/repositories/pizza_repository.dart'
    as pizza_repository;

List<String> categories = [
  'Tradicionais',
  'Especiais',
  'Doces',
  'Calzones',
  'Promoções',
];

List<Product> products = [
  pizza_repository.pizza1,
  pizza_repository.pizza3,
  pizza_repository.pizza5,
  pizza_repository.pizza6,
  pizza_repository.pizza7,
  pizza_repository.pizza8,
  pizza_repository.pizza9,
  pizza_repository.pizza10
];
