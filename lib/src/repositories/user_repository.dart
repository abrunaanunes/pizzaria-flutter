import 'package:gopizza/src/models/address.dart';
import 'package:gopizza/src/models/user.dart';

Address address1 = Address(
  address: 'Rua Valério Ronchi',
  number: '701',
  complement: 'Ap 302 T22',
  neighborhood: 'Uvaranas',
  city: 'Ponta Grossa',
  state: 'Paraná',
  zipCode: '84030-320',
  country: 'Brasil',
  isMain: true,
  name: 'Minha casa',
);

Address address2 = Address(
  address: 'Rua Teodoro Rosas',
  number: '1318',
  complement: 'Ap 2',
  neighborhood: 'Centro',
  city: 'Ponta Grossa',
  state: 'Paraná',
  zipCode: '84030-000',
  country: 'Brasil',
  isMain: false,
  name: 'Trabalho',
);

List<Address> addresses = [
  address1,
  address2,
];

User user = User(
  name: 'Maria Eduarda',
  email: 'mariaeduarda@alunos.utfpr.edu.br',
  cpf: '',
  phone: '(12) 9999-0000',
  address: addresses,
);
