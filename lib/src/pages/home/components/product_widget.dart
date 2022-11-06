import 'package:flutter/material.dart';
import 'package:gopizza/src/pages/product/product_page.dart';

import '../../../models/product.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (e) {
          return ProductPage(product: product);
        }));
      },
      child: SizedBox(
        width: 350,
        child: Card(
          elevation: 1,
          shadowColor: Colors.grey.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ListTile(
                title: Text(
                  product.name,
                ),
                subtitle: Text(
                  'Serve duas pessoas',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Image.asset(product.imgUrl),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  product.description,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
