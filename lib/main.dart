// @dart=2.9
import 'package:flutter/material.dart';
import 'package:gopizza/src/configs/hive_config.dart';
import 'package:gopizza/src/pages/auth/sign_in_page.dart';
import 'package:gopizza/src/pages/base/base_app.dart';
import 'package:gopizza/src/pages/home/home_page.dart';
import 'package:gopizza/src/repositories/cart_repository.dart';
import 'package:gopizza/src/repositories/order_repository.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Criar uma única inicialização do Hive
  await HiveConfig.start();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CartRepository>(create: (_) => CartRepository()),
      ChangeNotifierProvider<OrderRepository>(create: (_) => OrderRepository()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

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
      home: CheckAuth(),
    );
  }
}

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      setState(() {
        isAuth = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = BaseScreen();
    } else {
      child = SignInScreen();
    }
    return Scaffold(
      body: child,
    );
  }
}
