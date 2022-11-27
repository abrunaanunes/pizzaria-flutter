import 'package:gopizza/src/models/price.dart';
import 'package:gopizza/src/models/product.dart';

Product pizza1 = Product(
  id: '1',
  name: 'Alho e Óleo',
  imgUrl: 'assets/images/alho_e_oleo.jpg',
  price: Price(small: 35.00, large: 45.00, extraLarge: 60.00),
  description: 'Molho de tomate, muçarela, alho e óleo e orégano.',
);

Product pizza2 = Product(
  id: '2',
  name: 'Margherita',
  imgUrl: 'assets/images/margherita.jpg',
  price: Price(small: 35.00, large: 45.00, extraLarge: 60.00),
  description:
      'Molho de tomate, muçarela, tomate, parmesão, manjericão fresco e orégano.',
);

Product pizza3 = Product(
  imgUrl: 'assets/images/mucarela.jpg',
  id: '3',
  name: 'Muçarela',
  price: Price(small: 35.00, large: 45.00, extraLarge: 60.00),
  description: 'Molho de tomate, dupla camada de muçarela e orégano.',
);
Product pizza4 = Product(
  id: '4',
  name: 'Napolitana',
  imgUrl: 'assets/images/napolitana.jpg',
  price: Price(small: 35.00, large: 45.00, extraLarge: 60.00),
  description: 'Molho de tomate, muçarela, tomate picado, parmesão e orégano.',
);
Product pizza5 = Product(
  id: '5',
  name: 'Portuguesa',
  imgUrl: 'assets/images/portuguesa.jpg',
  price: Price(small: 35.00, large: 45.00, extraLarge: 60.00),
  description:
      'Molho de tomate, muçarela, presunto, ovos, cebola, azeitonas pretas e orégano.',
);
Product pizza6 = Product(
  id: '6',
  name: 'Quatro Queijos',
  imgUrl: 'assets/images/quatro_queijos.jpg',
  price: Price(small: 35.00, large: 45.00, extraLarge: 60.00),
  description:
      'Molho de tomate, muçarela, provolone, parmesão, requeijão cremoso e orégano.',
);
Product pizza7 = Product(
  id: '7',
  name: 'Romana',
  imgUrl: 'assets/images/romana.jpg',
  price: Price(small: 35.00, large: 45.00, extraLarge: 60.00),
  description: 'Molho de tomate, muçarela, presunto e orégano.',
);
Product pizza8 = Product(
  id: '8',
  name: 'Bacon ao BBQ',
  imgUrl: 'assets/images/molho_ao_bbq.jpg',
  price: Price(small: 35.00, large: 45.00, extraLarge: 60.00),
  description: 'Molho de tomate, muçarela, bacon, molho BBQ e orégano.',
);
