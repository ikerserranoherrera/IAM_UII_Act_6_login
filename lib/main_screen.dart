import 'package:flutter/material.dart';
import 'insesion.dart';
import 'registro.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fondo establecido en ThemeData (main.dart)
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 15,
                offset: Offset(0, 5),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Título con ícono a la izquierda
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // ÍNCK CAMBIADO A ESTRELLA
                  Icon(Icons.star, color: Color(0xFFFFC72C), size: 35),
                  SizedBox(width: 12),
                  Text(
                    "Carls jr",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Botón Iniciar Sesión (Redondeado)
              _buildRoundedButton(
                context, 
                "Iniciar Sesión", 
                const InSesion(),
              ),
              const SizedBox(height: 15),
              // Botón Registrarse (Redondeado)
              _buildRoundedButton(
                context, 
                "Registrarse", 
                const Registro(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper para crear botones redondeados uniformes
  Widget _buildRoundedButton(BuildContext context, String text, Widget page) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFC72C), // Color Botones
          foregroundColor: Colors.black,             // Color Texto
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Muy redondeado
          ),
          padding: const EdgeInsets.symmetric(vertical: 18),
        ),
        onPressed: () => Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => page)
        ),
        child: Text(
          text, 
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}