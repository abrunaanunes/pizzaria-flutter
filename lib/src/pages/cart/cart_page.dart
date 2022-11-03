import 'package:flutter/material.dart';
import 'package:gopizza/src/pages/cart/components/product_widget.dart';
import 'package:gopizza/src/pages/cart/payment_page.dart';
import 'package:gopizza/src/pages/profile/profile_page.dart';
import 'package:gopizza/src/repositories/cart_repository.dart';
import 'package:gopizza/src/repositories/user_repository.dart'
    as user_repository;
import 'package:provider/provider.dart';

import '../profile/components/address_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late CartRepository cart;
  @override
  Widget build(BuildContext context) {
    cart = Provider.of<CartRepository>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Carrinho")),
      body: Consumer<CartRepository>(builder: (context, cart, child) {
        return cart.products.isEmpty
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 22, horizontal: 12),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/cart.png'),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Seu carrinho está vazio :(',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 10),
                        height: 100,
                        width: 200,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Voltar",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 15,
                        ),
                        child: SizedBox(
                            child: ListView.separated(
                                itemBuilder: (_, index) {
                                  return ProductTile(
                                      product: cart.products[index]);
                                },
                                separatorBuilder: (_, index) =>
                                    const SizedBox(height: 10),
                                itemCount: cart.products.length))),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 6,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Endereço de entrega',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (c) {
                                      return const ProfilePage();
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: const Text(
                                  'Alterar',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 15,
                        ),
                        child: AddressTile(
                          address: user_repository.addresses[0],
                          isMain: 1,
                        ),
                      ),
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(30),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 3,
                                spreadRadius: 2,
                              )
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Row(
                                  children: const [
                                    Text(
                                      "Total do pedido:",
                                      style: TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                    Text(
                                      "135,00",
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (c) {
                                      return const PaymentPage();
                                    }));
                                  },
                                  child: const Text(
                                    "Finalizar pedido",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
      }),
    );
  }
}
