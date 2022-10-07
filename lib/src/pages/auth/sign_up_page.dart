import 'package:flutter/material.dart';
import 'package:gopizza/src/pages/components/custom_text_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../base/base_app.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
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
                            const CustomTextField(
                              icon: Icons.person,
                              label: 'Nome',
                            ),
                            CustomTextField(
                              icon: Icons.phone,
                              label: 'Celular',
                              inputFormatters: [phoneMask],
                            ),
                            CustomTextField(
                              icon: Icons.file_copy,
                              label: 'CPF',
                              inputFormatters: [cpfMask],
                            ),
                            CustomTextField(
                              icon: Icons.email,
                              label: 'E-mail',
                              validator: (value) {
                                String email = value.toString();
                                bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(email);
                                if (!emailValid) {
                                  return 'Campo inválido.';
                                }
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
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (c) {
                                      return const BaseScreen();
                                    }));
                                  }
                                },
                                child: const Text("Cadastrar usuário",
                                    style: TextStyle(
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
}
