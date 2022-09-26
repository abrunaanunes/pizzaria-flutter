import 'package:flutter/material.dart';
import 'package:gopizza/src/auth/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color scaffoldColor = const Color.fromARGB(255, 250, 248, 249);
    return MaterialApp(
      title: 'Go Pizza',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: scaffoldColor,
      ),
      home: const SignInScreen(),
    );
  }
}
