import 'package:flutter/material.dart';
import 'package:gopizza/src/models/product.dart';
import 'package:gopizza/src/services/utils_services.dart';

class PriceTile extends StatefulWidget {
  PriceTile({super.key, required this.product});
  final Product product;

  @override
  State<PriceTile> createState() => _PriceTileState();
}

class _PriceTileState extends State<PriceTile> {
  UtilsServices utilsServices = UtilsServices();

  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RadioListTile(
            contentPadding: EdgeInsets.zero,
            value: 1,
            groupValue: _value,
            onChanged: (val) => setState(() => _value = val as int),
            title: Text(
              utilsServices.priceToCurrency(
                widget.product.price.small,
              ),
            ),
            subtitle: const Text("Pequena"),
          ),
          RadioListTile(
            contentPadding: EdgeInsets.zero,
            value: 2,
            groupValue: _value,
            onChanged: (val) => setState(() => _value = val as int),
            title: Text(
              utilsServices.priceToCurrency(
                widget.product.price.large,
              ),
            ),
            subtitle: const Text("Grade"),
          ),
          RadioListTile(
            contentPadding: EdgeInsets.zero,
            value: 3,
            groupValue: _value,
            onChanged: (val) => setState(() => _value = val as int),
            title: Text(
              utilsServices.priceToCurrency(
                widget.product.price.extraLarge,
              ),
            ),
            subtitle: const Text("Gigante"),
          ),
        ],
      ),
    );
  }
}
