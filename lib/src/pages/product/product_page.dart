import 'package:flutter/material.dart';
import 'package:gopizza/src/models/product.dart';
import 'package:gopizza/src/pages/product/components/price_tile.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      // borderRadius: const BorderRadius.vertical(
                      //   bottom: Radius.circular(20),
                      // ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(product.imgUrl),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
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
                          // Tamanhos e preços
                          PriceTile(product: product),
                          // Descrição
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              product.description,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          // Botão adicionar ao carrinho
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Adicionar ao carrinho",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          )
                        ]),
                  ),
                )
              ],
            ),
          ),
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
      ],
    ));
  }
}
