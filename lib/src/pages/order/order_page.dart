import 'package:flutter/material.dart';
import 'package:gopizza/src/pages/order/components/order_widget.dart';
import 'package:gopizza/src/repositories/order_repository.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  late OrderRepository order;
  @override
  Widget build(BuildContext context) {
    order = Provider.of<OrderRepository>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus pedidos"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 15,
        ),
        child: Consumer<OrderRepository>(
          builder: ((context, value, child) {
            return order.orders.isEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 22, horizontal: 12),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Sua lista está vazia :(',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
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
                                  return OrderWidget(
                                      order: order.orders[index]);
                                },
                                separatorBuilder: (_, index) =>
                                    const SizedBox(height: 10),
                                itemCount: order.orders.length,
                              ),
                            ),
                          ),
                        ),
                      ]);
          }),
        ),
      ),
    );
  }
}
