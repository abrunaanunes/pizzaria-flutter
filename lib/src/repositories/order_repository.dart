import 'package:gopizza/src/models/order.dart';
import 'package:gopizza/src/models/product.dart';
import 'package:gopizza/src/repositories/pizza_repository.dart'
    as pizza_repository;
import 'package:gopizza/src/repositories/user_repository.dart'
    as user_repository;

List<Product> products1 = [
  pizza_repository.pizza21,
  pizza_repository.pizza22,
  pizza_repository.pizza23,
];

List<Product> products2 = [
  pizza_repository.pizza21,
  pizza_repository.pizza22,
  pizza_repository.pizza23,
];

List<Product> products3 = [
  pizza_repository.pizza21,
  pizza_repository.pizza22,
  pizza_repository.pizza23,
];

List<Product> products4 = [
  pizza_repository.pizza21,
  pizza_repository.pizza22,
  pizza_repository.pizza23,
];

List<Product> products5 = [
  pizza_repository.pizza21,
  pizza_repository.pizza22,
  pizza_repository.pizza23,
];

List<Product> products6 = [
  pizza_repository.pizza21,
  pizza_repository.pizza22,
  pizza_repository.pizza23,
];

Order order1 = Order(
  id: 2241,
  user: user_repository.user,
  date: '16 de agosto',
  products: products1,
  address: user_repository.user.address[0],
  amount: 45,
);

Order order2 = Order(
  id: 2242,
  user: user_repository.user,
  date: '17 de agosto',
  products: products2,
  address: user_repository.user.address[0],
  amount: 45,
);

Order order3 = Order(
  id: 3345,
  user: user_repository.user,
  date: '18 de agosto',
  products: products3,
  address: user_repository.user.address[0],
  amount: 45,
);

Order order4 = Order(
  id: 4567,
  user: user_repository.user,
  date: '19 de agosto',
  products: products4,
  address: user_repository.user.address[0],
  amount: 45,
);

Order order5 = Order(
  id: 5678,
  user: user_repository.user,
  date: '20 de agosto',
  products: products5,
  address: user_repository.user.address[0],
  amount: 45,
);

Order order6 = Order(
  id: 7890,
  user: user_repository.user,
  date: '21 de agosto',
  products: products6,
  address: user_repository.user.address[0],
  amount: 45,
);

List<Order> orders = [
  order6,
  order5,
  order4,
  order3,
  order2,
  order1,
];
