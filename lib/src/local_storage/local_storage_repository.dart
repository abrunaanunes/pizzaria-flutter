// import 'package:gopizza/src/local_storage/base_local_storage_repository.dart';
// import 'package:hive/hive.dart';
// import 'package:gopizza/src/models/product.dart';

// class LocalStorageRepository extends BaseLocalStorageRepository {
//   String boxName = 'cart_products';

//   @override
//   Future<Box> openBox() async {
//     Box box = await Hive.openBox<Product>(boxName);
//     return box;
//   }

//   @override
//   List<Product> getItems(Box box) {
//     return box.values.toList() as List<Product>;
//   }

//   @override
//   Future<void> addItem(Box box, Product product) async {
//     await box.put(product.id, product);
//   }

//   @override
//   Future<void> removeItem(Box box, Product product) async {
//     await box.delete(product.id);
//   }

//   @override
//   Future<void> clear(Box box) async {
//     await box.clear();
//   }
// }
