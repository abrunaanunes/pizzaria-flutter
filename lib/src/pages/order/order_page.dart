import 'package:flutter/material.dart';
import 'package:gopizza/src/pages/order/components/product_tile.dart';
import 'package:gopizza/src/repositories/order_repository.dart'
    as order_repository;

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus pedidos"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 15,
        ),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
            ),
            child: const Text(
              "Histórico",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 15,
              ),
              child: SizedBox(
                child: ListView.separated(
                  itemBuilder: (_, index) {
                    return ProductTile(order: order_repository.orders[index]);
                  },
                  separatorBuilder: (_, index) => const SizedBox(height: 10),
                  itemCount: order_repository.orders.length,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
