import 'package:flutter_proyecto/models/pedidos.dart';

class LogicaPedidos {
  // Lista estática para almacenar los pedidos
  static final List<Pedidos> _listaPedidos = [
    Pedidos(
      comprador: "Admin",
      numeroPedido: 00001,
      descripcion: "Este es un pedido de prueba",
      estado: "Pedido",
      precio: 19.99
    ),
  ];

  // Método para añadir un pedido a la lista
  static void anadirPedido(Pedidos pedidos) {
    _listaPedidos.add(pedidos);
  }

  // Método para obtener la lista de productos
  static List<Pedidos> getListaPedidos() {
    return _listaPedidos;
  }
}