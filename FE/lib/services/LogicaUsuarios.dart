import 'dart:convert';

import 'package:flutter_proyecto/data/models/user.dart';
import 'package:http/http.dart' as http;

class LogicaUsuarios {
  // Lista estática para almacenar los usuarios
  static final List<User> _listaUsuarios = [
    User(
      nombre: "Andres",
      contrasena: "Andres",
      contrasena2: "Andres",
      edad: 28,
      imagen: 'assets/images/logo.png',
      lugarNacimiento: "Zaragoza",
      administrador: false,
    ),
  ];

  // Método para añadir un usuario a la lista
  static void anadirUsuario(User usuario) {
    _listaUsuarios.add(usuario);
  }
}
