import 'package:avaliacaop1/app/data/user_mock_store.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

//classe ViewModel para o Login estendendo de ChageNotifier, além de gerenciar o estado e lógica da tela de login (MVVM)
class LoginViewmodel extends ChangeNotifier{
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;
  bool isLoading = false;

  String? emailValidator(String? value){
    return Validatorless.multiple([
      Validatorless.required('Email é obrigatório'),
      Validatorless.email('Digite um email válido'),
    ])(value);
  }

  String? passwordValidator(String? value){
    return Validatorless.multiple([
      Validatorless.required('Senha é obrigatória'),
      Validatorless.min(6, 'A senha deve possuir pelo menos 6 caracteres'),
    ])(value);
  }

  void togglePasswordVisibility(){
    obscurePassword = !obscurePassword;
    notifyListeners();
  }


  Future<bool> login() async{
    if(formKey.currentState?.validate() ?? false){
      isLoading = true;
      notifyListeners();

      //simula o tempo de carregamento
      await Future.delayed(const Duration(seconds: 1));
    
      //verifica se o usuário existe
      bool isValid = UserMockStore().authenticate(emailController.text, passwordController.text);

      isLoading = false;
      notifyListeners();
      return isValid;
    }
    return false;
  }
}