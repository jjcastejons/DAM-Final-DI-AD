import 'dart:convert';

import 'package:flutter_proyecto/models/user.dart';
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

  // Método para obtener la lista de usuarios
  static Future getListaUsuarios() {
    //return _listaUsuarios;
    return apiRequest('getall');
  }

  // TODO: Hay que pasar esta lógica a un servicio genérico que llame a la API
  static Future apiRequest(String path) async {
    final url = Uri.parse('http://localhost:8080/api/v1/users/$path');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        List<User> usuarios =
            jsonList.map((json) => User.fromJson(json)).toList();
        return usuarios;
      }
    } catch (e) {
      return null; // Error conexión API
    }
  }
}
