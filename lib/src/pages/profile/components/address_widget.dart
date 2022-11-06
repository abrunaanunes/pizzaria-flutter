import 'package:flutter/material.dart';
import 'package:gopizza/src/models/address.dart';

class AddressWidget extends StatelessWidget {
  AddressWidget({
    super.key,
    required this.address,
    this.isMain = 0,
  });
  Address address;
  final int isMain;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          elevation: 1,
          shadowColor: Colors.grey.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        value: isMain,
                        groupValue: 1,
                        onChanged: (val) => {},
                        title: Text(address.name),
                        subtitle: Text(
                            '${address.address}, ${address.number}, ${address.complement}, ${address.neighborhood}'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
