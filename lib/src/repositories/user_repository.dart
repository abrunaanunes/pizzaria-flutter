import 'package:gopizza/src/models/address.dart';
import 'package:gopizza/src/models/user.dart';

User user = User(
    name: 'Maria Eduarda',
    email: 'mariaeduarda@alunos.utfpr.edu.br',
    cpf: '',
    phone: '(12) 9999-0000',
    address: [
      Address(
        address: 'Rua Valério Ronchi',
        number: '701',
        complement: 'Ap 302 T22',
        neighborhood: 'Uvaranas',
        city: 'Ponta Grossa',
        state: 'Paraná',
        zipCode: '84030-320',
        country: 'Brasil',
      ),
    ]);
