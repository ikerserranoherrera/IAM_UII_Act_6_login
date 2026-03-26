// lib/local_db.dart

class LocalDb {
  // Usamos 'static' para que los datos sean globales 
  // y accesibles desde cualquier pantalla sin crear una nueva instancia.
  static String? email;
  static String? password;
  static String? username;
}