import 'package:avaliacaop1/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

//classe da tela de abertura (SplashPage) exibida ao iniciar o app
class SplashPage extends StatefulWidget{
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>{
  @override
  void initState(){
    super.initState();
    //aguarda 3 segundos antes de navegar para o login
    Future.delayed(const Duration(seconds: 3),(){
      //mounted verifica se o widget está ativo antes de navegar
      if(mounted){
        Navigator.pushReplacementNamed(context, AppRoutes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.flutter_dash_outlined, 
              size: 100,
              color: Colors.indigo,
            ),
            SizedBox(height: 24),
            Text(
              'Aplicativo Flutter - P1',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 14),
            Text(
              'Carregando...',
              style: TextStyle(
                fontSize: 14,
                color: Colors.indigo.shade300
              ),
            ),
          ],
        ),
      )
    );
  }
}