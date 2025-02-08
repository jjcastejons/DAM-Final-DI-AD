class User {
  final String nombre;
  final String contrasena;
  final String contrasena2;
  final String imagen;
  final int edad;
  final String lugarNacimiento;
  final bool administrador;

  User({
    required this.nombre,
    required this.contrasena,
    required this.contrasena2,
    required this.imagen,
    required this.edad,
    required this.lugarNacimiento,
    required this.administrador,
  });

  @override
  String toString() {
    return 'User(nombre: $nombre, contrasena: $contrasena, contrasena2: $contrasena2)';
  }

  String getNombre() {
    return nombre;
  }

  String getPass() {
    return contrasena;
  }

  String getImage() {
    return imagen;
  }

  int getEdad() {
    return edad;
  }

  String getLugarNacimiento() {
    return lugarNacimiento;
  }

  bool getAdministrador() {
    return administrador;
  }

  // Convierte un JSON a un objeto User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      nombre: json['nombre'] ?? '',
      contrasena: json['contrasena'] ?? '',
      contrasena2: json['contrasena2'] ?? '',
      imagen: json['imagen'] ?? '',
      edad: json['edad'] ?? 0,
      lugarNacimiento: json['lugarNacimiento'] ?? '',
      administrador: json['administrador'] ?? false,
    );
  }
}
