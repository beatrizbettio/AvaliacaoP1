import 'package:avaliacaop1/features/auth/viewmodels/register_viewmodel.dart';
import 'package:flutter/material.dart';

//classe da tela de cadastro
class RegisterPage extends StatefulWidget{
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{
  late final RegisterViewmodel viewModel;

  @override
  void initState(){
    super.initState();
    viewModel = RegisterViewmodel();
  }

  @override
  void dispose(){
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return AnimatedBuilder(
      animation: viewModel, 
      builder: (_, __){
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cadastro'),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: viewModel.nameController,
                      validator: viewModel.defaultValidator,
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                        border:OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox (height: 16),
                    TextFormField(
                      controller: viewModel.emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: viewModel.emailValidator,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border:OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: viewModel.passwordController,
                      obscureText: viewModel.obscurePassword,
                      validator: viewModel.passwordlValidator,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: viewModel.togglePasswordVisibility, 
                          icon: Icon(viewModel.obscurePassword ? Icons.visibility_off : Icons.visibility_rounded),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: (){
                          if(viewModel.register()){
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Cadastro realizado com sucesso!'
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.pop(context);//retornar ao login
                          }
                        }, 
                        child: const Text('Salvar Cadastro'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}