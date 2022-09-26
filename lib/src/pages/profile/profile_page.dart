import 'package:flutter/material.dart';
import 'package:gopizza/src/pages/components/custom_text_field.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: const [
          CustomTextField(icon: Icons.person, label: "Nome"),
          CustomTextField(icon: Icons.email, label: "E-mail"),
          CustomTextField(icon: Icons.file_copy, label: "CPF"),
          CustomTextField(icon: Icons.phone, label: "Celular"),
        ],
      ),
    );
  }
}
