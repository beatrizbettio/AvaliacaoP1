import 'package:avaliacaop1/app/routes/app_pages.dart';
import 'package:avaliacaop1/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

//widget raiz do app, sem estado (não muda)
class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Atividade Avaliativa P1',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationThemeData(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      //primeira tela a ser axibida no app
      initialRoute: AppRoutes.splash,
      routes: AppPages.routes,
    );
  }
}