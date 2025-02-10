import 'package:flutter_proyecto/data/models/user.dart';
import 'package:flutter_proyecto/data/services/ApiService.dart';

class UsuarioRepository {
  final ApiService _apiService = ApiService();

  Future<List<User>> getListaUsuarios() async {
    try {
      final response = await _apiService.dio.get("/users/getall");
      return (response.data as List)
          .map((json) => User.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception("Error al obtener usuarios");
    }
  }

  Future<void> anadirUsuario(User user) async {
    await _apiService.dio.post("/users", data: user.toJson());
  }

  Future<void> actualizarUsuario(String id, User user) async {
    await _apiService.dio.put("/users/$id", data: user.toJson());
  }

  Future<void> eliminarUsuario(int id) async {
    await _apiService.dio.delete("/users/$id");
  }
}
