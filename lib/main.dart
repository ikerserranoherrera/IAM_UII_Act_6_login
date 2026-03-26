import 'package:flutter/material.dart';
import 'main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carls jr iker',
      debugShowCheckedModeBanner: false,
      // Definimos la paleta de colores globalmente
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF0F4F8), // Fondo solicitado
        primaryColor: const Color(0xFFFFC72C),           // Color primario
        // Configuración por defecto para los inputs
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.black54),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFC72C)),
          ),
        ),
      ),
      home: const MainScreen(),
    );
  }
}