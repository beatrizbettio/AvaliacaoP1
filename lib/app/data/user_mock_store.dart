import 'package:avaliacaop1/app/models/user_model.dart';

//classe para armazenar os dados mockados do usuário
class UserMockStore {
  //padrão singleton (garante a existência de uma instância desta classe)
  static final UserMockStore _instance = UserMockStore._internal();
  factory UserMockStore() => _instance;
  UserMockStore._internal();

  //lista dos usuários
  final List<UserModel> _users = [];

  //adiciona novo usuário na lista
  void addUser(UserModel user){
    _users.add(user);
  }

  //verifica se existe email e senha de usuário informados, para autenticar o login 
  bool authenticate(String email, String password){
    return _users.any((user) => user.email == email && user.password == password);
  }
}