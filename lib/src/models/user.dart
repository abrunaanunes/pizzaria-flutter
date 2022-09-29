import 'package:gopizza/src/models/address.dart';

class User {
  String name;
  String email;
  String cpf;
  String phone;
  Address address;

  User({
    required this.name,
    required this.email,
    required this.cpf,
    required this.phone,
    required this.address,
  });
}
