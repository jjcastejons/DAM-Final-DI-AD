import 'package:flutter_proyecto/data/models/productos.dart';
import 'package:flutter_proyecto/data/services/ApiService.dart';

class ProductoRepository {
  final ApiService _apiService = ApiService();

  Future<List<Productos>> getListaProductos() async {
    try {
      final response = await _apiService.dio.get("/products/getall");
      return (response.data as List)
          .map((json) => Productos.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception("Error al obtener productos");
    }
  }

  Future<void> anadirProducto(Productos productos) async {
    await _apiService.dio.post("/products", data: productos.toJson());
  }

  Future<void> actualizarProducto(String id, Productos productos) async {
    await _apiService.dio.put("/products/$id", data: productos.toJson());
  }

  Future<void> eliminarProducto(int id) async {
    await _apiService.dio.delete("/products/$id");
  }
}
