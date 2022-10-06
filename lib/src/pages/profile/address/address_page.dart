import 'package:flutter/material.dart';
import 'package:gopizza/src/pages/profile/components/custom_text_field.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Perfil",
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  children: [
                    const CustomTextField(label: "Nome do endereço"),
                    const CustomTextField(label: "Logradouro"),
                    const CustomTextField(label: "Número"),
                    const CustomTextField(label: "Bairro"),
                    const CustomTextField(label: "Complemento"),
                    RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      value: 1,
                      groupValue: 1,
                      onChanged: (val) => {},
                      title: const Text('Este é meu endereço principal'),
                      subtitle: const Text(
                          'Marque para usar como endereço principal'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 120,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
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
                            "Adicionar endereço",
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
        ));
  }
}
