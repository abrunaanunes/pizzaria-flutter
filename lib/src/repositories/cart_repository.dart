import 'dart:collection';
import 'package:gopizza/src/local_storage/base_local_storage_repository.dart';
import 'package:gopizza/src/models/product.dart';
import 'package:hive/hive.dart';

class CartRepository extends BaseLocalStorageRepository {
  List<Product> _products = [];

  double _totalPrice = 0.00;
  UnmodifiableListView<Product> get products => UnmodifiableListView(_products);

  String boxName = 'cart_products';

  double get totalPrice => _totalPrice;
  set totalPrice(double value) => _totalPrice = value;

  @override
  Future<Box> openBox() async {
    // Abrindo box
    Box box = await Hive.openBox<Product>(boxName);
    return box;
  }

  @override
  Future<void> getItems() async {
    Box box = await openBox();

    // Buscando dados do banco e passando para lista do repositório
    _products = box.values.toList() as List<Product>;
    updateTotalPrice();
    notifyListeners();
  }

  @override
  Future<void> addItem(Product product) async {
    if (!_products.contains(product)) {
      Box box = await openBox();

      // Atualizando lista do repositório
      _products.add(product);
      updateTotalPrice();

      // Atualizando banco
      await box.put(product.id, product);
    }

    // Notificando repositório
    notifyListeners();
  }

  @override
  Future<void> removeItem(Product product) async {
    Box box = await openBox();

    // Atualizando lista do repositório
    _products.remove(product);
    updateTotalPrice();

    // Atualizando banco
    await box.delete(product.id);

    // Notificando repositório
    notifyListeners();
  }

  @override
  Future<void> clear() async {
    Box box = await openBox();

    //Atualizando lista do repositório
    for (Product product in _products) {
      _products.remove(product);
    }
    updateTotalPrice();

    // Atualizando banco
    await box.clear();

    // Notificando repositório
    notifyListeners();
  }

  void updateTotalPrice() {
    for (Product product in _products) {
      totalPrice = product.choosedSize;
    }
  }
}
