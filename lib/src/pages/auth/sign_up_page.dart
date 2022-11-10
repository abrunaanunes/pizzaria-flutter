import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gopizza/src/network/api.dart';
import 'package:gopizza/src/pages/components/custom_text_field.dart';
import 'package:gopizza/src/pages/home/home_page.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../base/base_app.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var name;
  var email;
  var password;
  var document;
  var phone;

  final cpfMask = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final phoneMask = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Cadastro",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),
                  // Formulário
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(45),
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomTextField(
                              icon: Icons.person,
                              label: 'Nome',
                              validator: (value) {
                                String nameValue = value.toString();
                                if (value!.length < 2) {
                                  return 'Campo inválido.';
                                }
                                name = nameValue;
                                return null;
                              },
                            ),
                            CustomTextField(
                              icon: Icons.phone,
                              label: 'Celular',
                              inputFormatters: [phoneMask],
                              validator: (value) {
                                String phoneValue = value.toString();
                                if (value!.length < 8) {
                                  return 'Campo inválido.';
                                }
                                phone = phoneValue;
                                return null;
                              },
                            ),
                            CustomTextField(
                              icon: Icons.file_copy,
                              label: 'CPF',
                              inputFormatters: [cpfMask],
                              validator: (value) {
                                String documentValue = value.toString();
                                if (value!.length < 14) {
                                  return 'Campo inválido.';
                                }
                                document = documentValue;
                                return null;
                              },
                            ),
                            CustomTextField(
                              icon: Icons.email,
                              label: 'E-mail',
                              validator: (value) {
                                String emailValue = value.toString();
                                bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(emailValue);
                                if (!emailValid) {
                                  return 'Campo inválido.';
                                }
                                email = emailValue;
                              },
                            ),
                            CustomTextField(
                              icon: Icons.lock,
                              label: 'Senha',
                              isSecret: true,
                              validator: (value) {
                                if (value!.length < 6) {
                                  return 'Campo inválido.';
                                }
                                password = value;
                              },
                            ),
                            SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _register();
                                  }
                                },
                                child: Text(
                                    _isLoading
                                        ? "Processando..."
                                        : "Cadastrar usuário",
                                    style: const TextStyle(
                                      fontSize: 18,
                                    )),
                              ),
                            ),
                          ]),
                    ),
                  )
                ],
              ),
              Positioned(
                left: 10,
                top: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _register() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      'name': name,
      'email': email,
      'password': password,
      'document': document,
      'phone': phone,
    };

    var res = await Network().authData(data, '/register');
    var body = json.decode(res.body);
    if (body['success'] == true) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => BaseScreen()),
      );
    } else {
      print(body);
    }

    setState(() {
      _isLoading = false;
    });
  }
}
