//dart
import 'package:flutter/material.dart';
//paquetes externos
import 'package:cinemapedia/config/router/app_router.dart';
//nuestras
import 'package:cinemapedia/config/theme/app_theme.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
