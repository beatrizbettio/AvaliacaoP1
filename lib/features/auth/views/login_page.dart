import 'package:avaliacaop1/app/routes/app_routes.dart';
import 'package:avaliacaop1/features/auth/viewmodels/login_viewmodel.dart';
import 'package:flutter/material.dart';

//classe da tela de login
class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  late final LoginViewmodel viewModel;

  @override
  void initState(){
    super.initState();
    viewModel = LoginViewmodel();
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
            title: Text('Login'),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Icon(
                      Icons.lock_outlined,
                      color: Colors.black,
                      size: 80,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Bem-vindo',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Faça login para continuar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    TextFormField(
                      controller: viewModel.emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: viewModel.emailValidator,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          size: 40,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: viewModel.passwordController,
                      obscureText: viewModel.obscurePassword,
                      validator: viewModel.passwordValidator,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.lock_outlined,
                          size: 40,
                          color: Colors.indigo,
                        ),
                        suffixIcon: IconButton(
                          onPressed: viewModel.togglePasswordVisibility, 
                          icon: Icon(
                            viewModel.obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility_rounded,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: viewModel.isLoading ? null : () async{
                          bool success = await viewModel.login();
                          
                          if(!context.mounted) return;

                          if(success){
                            Navigator.pushReplacementNamed(context, AppRoutes.home);
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Email ou senha inválidos!',
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        child: viewModel.isLoading
                          ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )
                          : const Text('Entrar'),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Não possui conta?'),
                        TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, AppRoutes.register);
                          }, 
                          child: const Text('Cadastre-se'),
                        ),
                      ],
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