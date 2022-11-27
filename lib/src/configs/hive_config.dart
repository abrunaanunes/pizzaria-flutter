import 'dart:io';
import 'package:gopizza/src/models/price.dart';
import 'package:gopizza/src/models/product.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

class HiveConfig {
  static start() async {
    Directory dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);

    // Registrando o adaptador
    Hive.registerAdapter(ProductAdapter());
    Hive.registerAdapter(PriceAdapter());

    // Acessando os dados
    // await Hive.openBox('')
  }
}
