import 'package:avaliacaop1/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

//classe da tela principal (home) após um login bem-sucedido
class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.login);
            }, 
            icon: const Icon(
              Icons.logout_outlined,
              size: 80,
              color: Colors.indigo,
            ),
          )
        ],
      ),
      body:SafeArea(
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.home_outlined, 
                size: 80, 
                color: Colors.indigo,
              ),
              SizedBox(height: 16),
              Text(
                'Seja bem-vindo à Home',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}