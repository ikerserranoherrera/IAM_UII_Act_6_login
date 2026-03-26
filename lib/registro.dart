import 'package:flutter/material.dart';
import 'local_db.dart';
import 'insesion.dart';

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  // Controladores para capturar texto
  final userCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final confirmPassCtrl = TextEditingController();

  void _registrar() {
    // Validación básica sin dependencias externas
    if (userCtrl.text.isEmpty || emailCtrl.text.isEmpty || passCtrl.text.isEmpty) {
      _showSnack("Por favor rellena todos los campos.");
      return;
    }

    if (passCtrl.text != confirmPassCtrl.text) {
      _showSnack("Las contraseñas no coinciden.");
      return;
    }

    // Guardar en la "base de datos" local
    LocalDb.username = userCtrl.text;
    LocalDb.email = emailCtrl.text;
    LocalDb.password = passCtrl.text;
    
    _showSnack("¡Registro exitoso! Ya puedes iniciar sesión.");
    
    // Navegar automáticamente a Login
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(builder: (context) => const InSesion())
    );
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registro"),
        backgroundColor: const Color(0xFFFFC72C), // Color AppBar
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            TextField(controller: userCtrl, decoration: const InputDecoration(labelText: "Nombre de usuario")),
            const SizedBox(height: 10),
            TextField(controller: emailCtrl, decoration: const InputDecoration(labelText: "Correo electrónico"), keyboardType: TextInputType.emailAddress),
            const SizedBox(height: 10),
            TextField(controller: passCtrl, decoration: const InputDecoration(labelText: "Contraseña"), obscureText: true),
            const SizedBox(height: 10),
            TextField(controller: confirmPassCtrl, decoration: const InputDecoration(labelText: "Confirmar contraseña"), obscureText: true),
            const SizedBox(height: 35),
            // Botón Registrarse
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFC72C),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.all(15),
                ),
                onPressed: _registrar,
                child: const Text("Registrarse", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 15),
            // Texto inferior con navegación
            TextButton(
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const InSesion())),
              child: const Text(
                "¿Ya tienes cuenta? Inicia Sesión", 
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