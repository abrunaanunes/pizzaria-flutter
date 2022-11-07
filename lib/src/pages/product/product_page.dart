import 'package:flutter/material.dart';
import 'package:gopizza/src/models/product.dart';
import 'package:gopizza/src/pages/product/components/price_widget.dart';
import 'package:gopizza/src/repositories/cart_repository.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    late CartRepository cart;
    cart = Provider.of<CartRepository>(context, listen: true);

    return Scaffold(
        body: Stack(
      children: [
        ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(product.imgUrl),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(32),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Nome do produto
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 27,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      product.description,
                      style: const TextStyle(
                        fontSize: 18,
                        height: 1.5,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  // Tamanhos e preços
                  PriceWidget(product: product),
                ],
              ),
            ),
            const SizedBox(
              height: 65,
            )
          ],
        ),
        Positioned(
          left: 10,
          top: 10,
          child: SafeArea(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
        ),
        // Botão adicionar ao carrinho
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
            height: 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              onPressed: () {
                if (product.choosedSize != 0.00) {
                  cart.addItem(product);
                }
              },
              child: const Text(
                "Adicionar ao carrinho",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
