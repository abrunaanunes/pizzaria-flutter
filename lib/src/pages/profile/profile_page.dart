import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gopizza/src/network/api.dart';
import 'package:gopizza/src/pages/auth/sign_in_page.dart';
import 'package:gopizza/src/pages/profile/address/address_page.dart';
import 'package:gopizza/src/pages/profile/components/address_widget.dart';
import 'package:gopizza/src/pages/profile/components/custom_text_field.dart';
import 'package:gopizza/src/repositories/user_repository.dart'
    as user_repository;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _nome = TextEditingController();
  late TextEditingController _email = TextEditingController();
  late TextEditingController _cpf = TextEditingController();
  late TextEditingController _celular = TextEditingController();

  void _buscarUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final user = prefs.getString('user') ?? '';
    var parsedJson = json.decode(user);

    if (this.mounted) {
      setState(() {
        _nome.text = parsedJson['name'];
        _email.text = parsedJson['email'];
        _cpf.text = parsedJson['document'];
        _celular.text = parsedJson['phone'];
      });
    }
  }

  final cpfMask = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  var user = {};

  final phoneMask = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _buscarUsuario();
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Perfil",
          ),
          actions: [
            IconButton(
              onPressed: () {
                _logout();
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          child: Column(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 75,
                      backgroundColor: Colors.grey.shade200,
                      child: const CircleAvatar(
                        radius: 70,
                        backgroundImage:
                            AssetImage('assets/images/default.png'),
                      ),
                    ),
                    Positioned(
                      bottom: 1,
                      right: 1,
                      child: Container(
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Icon(Icons.add_a_photo, color: Colors.black),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 3,
                              color: Colors.white,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                50,
                              ),
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(2, 4),
                                color: Colors.black.withOpacity(
                                  0.3,
                                ),
                                blurRadius: 3,
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                          label: "Nome", controller: _nome, enabled: true),
                      CustomTextField(
                          label: "E-mail", controller: _email, enabled: true),
                      CustomTextField(
                          label: "CPF", controller: _cpf, enabled: true),
                      CustomTextField(
                          label: 'Celular', controller: _celular, enabled: true)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Meus endereços',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (c) {
                              return const AddressPage();
                            },
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Text(
                          'Adicionar endereço',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (_, index) {
                    return AddressWidget(
                      address: user_repository.addresses[index],
                      isMain: index == 0 ? 1 : 0,
                    );
                  },
                  separatorBuilder: (_, index) {
                    return const SizedBox(
                      height: 6,
                    );
                  },
                  itemCount: user_repository.addresses.length,
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
                      Expanded(child: Container()),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          onPressed: () {
                            // if (_formKey.currentState!.validate()) {
                            //   Navigator.of(context).pop();
                            // }
                          },
                          child: const Text(
                            "Salvar alterações",
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

  void _logout() async {
    var res = await Network().getData('/logout');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignInScreen()));
    }
  }
}
