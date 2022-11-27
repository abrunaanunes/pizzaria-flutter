import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:gopizza/src/pages/cart/cart_page.dart';
import 'package:gopizza/src/pages/home/components/product_widget.dart';
import 'package:gopizza/src/repositories/cart_repository.dart';
import 'package:provider/provider.dart';
import 'components/category_widget.dart';
import 'package:gopizza/src/repositories/home_repository.dart'
    as home_repository;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CartRepository cart;

  @override
  Widget build(BuildContext context) {
    Color customGreyColor = const Color.fromARGB(255, 68, 66, 67);
    String selectedCategory = 'Tradicionais';
    final size = MediaQuery.of(context).size;
    cart = Provider.of<CartRepository>(context, listen: true);

    // Puxando os dados do banco
    cart.getItems();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                right: 15,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (c) {
                        return const CartPage();
                      },
                    ),
                  );
                },
                child: Badge(
                  badgeColor: Colors.redAccent,
                  badgeContent: Text(
                    cart.products.length.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Text.rich(
                    TextSpan(
                      style: const TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: "Sua pizza favorita em ",
                          style: TextStyle(color: customGreyColor),
                        ),
                        const TextSpan(
                          text: "menos de 30 minutos",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                      hintText: "Buscar...",
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 16,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 21,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                    ),
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return CategoryWidget(
                          category: home_repository.categories[index],
                          isSelected: home_repository.categories[index] ==
                              selectedCategory,
                        );
                      },
                      separatorBuilder: (_, index) => const SizedBox(width: 10),
                      itemCount: home_repository.categories.length,
                    ),
                  ),
                  SizedBox(
                    height: 400,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return ProductWidget(
                            product: home_repository.products[index],
                          );
                        },
                        separatorBuilder: (_, index) =>
                            const SizedBox(width: 10),
                        itemCount: home_repository.products.length),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
