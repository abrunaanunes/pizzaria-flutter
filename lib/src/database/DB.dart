import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DB {
  // Construtor com acesso privado
  DB._();

  // Criando instância do DB
  static final DB instance = DB._();

  // Instancia do SQLite
  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'gopizza.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, version) async {
    await db.execute(_carts);
    await db.execute(_products);
    await db.execute(_productCart);
    await db.execute(_prices);
    await db.execute(_orders);
  }

  _carts() async {} // id do carrinho, status, user_id, data de criação, data de atualização
  _products() async {} // todos os dados do nosso model produto e o id do price, data de criação e data de atualização
  _productCart() async {} // id do produto e id do carrinho (tabela de relacionamento)
  _prices() async {} // dados do nosso model price, data de criação e data de atualização
  _orders() async {} // id do carrinho, valor total, user_id, data de criação e data de atualização
}
