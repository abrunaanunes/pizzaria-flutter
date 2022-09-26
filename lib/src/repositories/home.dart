import 'package:gopizza/src/models/product.dart';

Product calabresa = Product(
  name: 'Calabresa',
  imgUrl: 'assets/images/pizza_calabresa.jpg',
  price: 30.00,
  description: 'Pizza salgada',
);

List<Product> products = [
  calabresa,
];

List<String> categories = [
  'Tradicionais',
  'Especiais',
  'Doces',
  'Calzones',
  'Promoções',
];
