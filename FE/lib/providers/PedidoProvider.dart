import 'package:flutter/material.dart';

import '../data/models/pedidos.dart';
import '../data/repositories/PedidoRepository.dart';

class PedidoProvider with ChangeNotifier {
  final PedidoRepository _pedidoRepository = PedidoRepository();
  List<Pedidos> _pedidos = [];

  List<Pedidos> get pedidos => _pedidos;

  Future<void> fetchPedidos() async {
    _pedidos = await _pedidoRepository.getListaPedidos();
    notifyListeners();
  }

  Future<void> addPedido(Pedidos pedido) async {
    await _pedidoRepository.anadirPedido(pedido);
    fetchPedidos();
  }

  Future<void> updatePedido(int id, Pedidos pedido) async {
    await _pedidoRepository.actualizarPedido(id, pedido);
    fetchPedidos();
  }

  Future<void> deletePedido(int id) async {
    await _pedidoRepository.eliminarPedido(id);
    fetchPedidos();
  }
}
