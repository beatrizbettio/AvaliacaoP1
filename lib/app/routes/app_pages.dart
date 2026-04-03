import 'package:avaliacaop1/app/routes/app_routes.dart';
import 'package:avaliacaop1/features/auth/views/home_page.dart';
import 'package:avaliacaop1/features/auth/views/login_page.dart';
import 'package:avaliacaop1/features/auth/views/register_page.dart';
import 'package:avaliacaop1/features/auth/views/splash_page.dart';
import 'package:flutter/material.dart';

//classe abstrata que centraliza o mapeamento de rotas para as páginas
abstract class AppPages {
  //getter que retorna um Map relacionando cada rota à sua tela
  static Map<String, WidgetBuilder> get routes => {
    AppRoutes.splash: (_) => const SplashPage(),
    AppRoutes.login: (_) => const LoginPage(),
    AppRoutes.register: (_) => const RegisterPage(),
    AppRoutes.home: (_) => const HomePage(),
  };
}