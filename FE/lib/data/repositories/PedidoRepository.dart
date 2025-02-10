import 'package:flutter_proyecto/data/services/ApiService.dart';

import '../models/pedidos.dart';

class PedidoRepository {
  final ApiService _apiService = ApiService();

  Future<List<Pedidos>> getListaPedidos() async {
    try {
      final response = await _apiService.dio.get("/orders/getall");
      return (response.data as List)
          .map((json) => Pedidos.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception("Error al obtener pedidos");
    }
  }

  Future<void> anadirPedido(Pedidos pedidos) async {
    await _apiService.dio.post("/orders", data: pedidos.toJson());
  }

  Future<void> actualizarPedido(String id, Pedidos pedidos) async {
    await _apiService.dio.put("/orders/$id", data: pedidos.toJson());
  }

  Future<void> eliminarPedido(int id) async {
    await _apiService.dio.delete("/orders/$id");
  }
}
