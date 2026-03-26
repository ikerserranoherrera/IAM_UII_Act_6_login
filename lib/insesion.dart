import 'package:flutter/material.dart';
import 'local_db.dart';
import 'registro.dart';

class InSesion extends StatefulWidget {
  const InSesion({super.key});

  @override
  State<InSesion> createState() => _InSesionState();
}

class _InSesionState extends State<InSesion> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  void _login() {
    String inputEmail = emailCtrl.text;
    String inputPass = passCtrl.text;

    // Comprobar contra datos guardados (o null si no se ha registrado nadie)
    if (LocalDb.email != null && inputEmail == LocalDb.email && inputPass == LocalDb.password) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("¡Bienvenido de nuevo, ${LocalDb.username}!"),
          backgroundColor: Colors.green,
        ),
      );
      // Aquí navegarías a la pantalla de inicio real de la guardería
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error: Correo o contraseña incorrectos."),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Iniciar Sesión"),
        backgroundColor: const Color(0xFFFFC72C), // Color AppBar
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            TextField(
              controller: emailCtrl, 
              decoration: const InputDecoration(labelText: "Correo electrónico"),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passCtrl, 
              decoration: const InputDecoration(labelText: "Contraseña"), 
              obscureText: true
            ),
            const SizedBox(height: 35),
            // Botón Iniciar Sesión
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFC72C),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.all(15),
                ),
                onPressed: _login,
                child: const Text("Iniciar Sesión", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 15),
            // Texto inferior con navegación
            TextButton(
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Registro())),
              child: const Text(
                "¿No tienes cuenta? Regístrate", 
                style: TextStyle(color: Colors.black54),
              ),
            )
          ],
        ),
      ),
      // Footer solicitado
      bottomNavigationBar: Container(height: 40, color: const Color(0xFFF5D04C)),
    );
  }
}