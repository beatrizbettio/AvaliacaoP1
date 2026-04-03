import 'package:avaliacaop1/app/data/user_mock_store.dart';
import 'package:avaliacaop1/app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

//classe ViewModel para o Cadastro estendendo de ChageNotifier para notificar quando algum dado mudar (MVVM)
class RegisterViewmodel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;

  String? defaultValidator(String? value) => Validatorless.required('Campo obrigatório')(value);

  String? emailValidator(String? value){
    return Validatorless.multiple([
      Validatorless.required('Email é obrigatório'),
      Validatorless.email('Digite um email válido'),
    ])(value);
  }

  String? passwordlValidator(String? value){
    return Validatorless.multiple([
      Validatorless.required('Senha é obrigatória'),
      Validatorless.min(6,'A senha deve possuir pelo menos 6 caracteres.'),
    ])(value);
  }

  //altera a visibilidade do campo de senha
  void togglePasswordVisibility(){
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  bool register(){
    if (formKey.currentState?.validate() ?? false){
      final newUser = UserModel(
        name: nameController.text,
        email: emailController.text, 
        password: passwordController.text,
      );
      //registra o novo usuário
      UserMockStore().addUser(newUser);
      return true;
    }
    return false;
  }
}