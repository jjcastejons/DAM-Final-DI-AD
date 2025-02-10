import 'package:flutter/material.dart';
import 'package:flutter_proyecto/data/models/user.dart';
import 'package:flutter_proyecto/data/repositories/UsuarioRepository.dart';

class UsuarioProvider with ChangeNotifier {
  final UsuarioRepository _usuarioRepository = UsuarioRepository();
  List<User> _usuarios = [];

  List<User> get usuarios => _usuarios;

  Future<void> fetchUsuarios() async {
    _usuarios = await _usuarioRepository.getListaUsuarios();
    notifyListeners();
  }

  Future<List<User>> fetchListaUsuarios() async {
    return await _usuarioRepository.getListaUsuarios();
  }

  Future<void> addUsuario(User usuario) async {
    await _usuarioRepository.anadirUsuario(usuario);
    fetchUsuarios();
  }

  Future<void> updateUsuario(String id, User usuario) async {
    await _usuarioRepository.actualizarUsuario(id, usuario);
    fetchUsuarios();
  }

  Future<void> deleteUsuario(int id) async {
    await _usuarioRepository.eliminarUsuario(id);
    fetchUsuarios();
  }
}
