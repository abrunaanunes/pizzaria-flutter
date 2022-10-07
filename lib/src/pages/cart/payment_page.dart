import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Color customGreyColor = const Color.fromARGB(255, 68, 66, 67);

    return Scaffold(
      appBar: AppBar(title: const Text("Check-out")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Faça o pagamento para finalizar o pedido.",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: customGreyColor,
              ),
            ),
            const Text(
              'Valor a ser pago: 135,00',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 3,
                        spreadRadius: 2,
                      )
                    ]),
                child: Image.asset('assets/images/pix.jpg'),
              ),
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      18,
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Copiar código",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
