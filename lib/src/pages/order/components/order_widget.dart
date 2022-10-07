import 'package:flutter/material.dart';
import 'package:gopizza/src/models/order.dart';
import 'package:gopizza/src/services/utils_services.dart';

class OrderTile extends StatefulWidget {
  const OrderTile({super.key, required this.order});

  final Order order;

  @override
  State<OrderTile> createState() => _OrderTileState();
}

class _OrderTileState extends State<OrderTile> {
  UtilsServices utilsServices = UtilsServices();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(widget.order.date),
        const SizedBox(
          height: 10,
        ),
        Card(
          elevation: 1,
          shadowColor: Colors.grey.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.check_circle_rounded,
                            color: Colors.green,
                          ),
                          title: const Text(
                            'Pedido concluído',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Text(
                            'N° ${widget.order.id}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          trailing: const Icon(Icons.more_vert),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: ListView.separated(
                            // Não ter efeito de puxar
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      widget.order.products[index].name,
                                    ),
                                  ),
                                  Text(
                                    utilsServices.priceToCurrency(
                                      widget.order.products[index].price.small,
                                    ),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (_, index) {
                              return const SizedBox(height: 5);
                            },
                            itemCount: widget.order.products.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
