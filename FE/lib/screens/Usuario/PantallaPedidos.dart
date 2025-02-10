import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/PedidoProvider.dart';

class PantallaPedidos extends StatefulWidget {
  const PantallaPedidos({super.key, required this.nombreUsuario});

  final String nombreUsuario;

  @override
  State<PantallaPedidos> createState() => _PantallaPedidosState();
}

class _PantallaPedidosState extends State<PantallaPedidos> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PedidoProvider>(
      builder: (context, pedidoProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Verificar si hay productos
              pedidoProvider.pedidos.isEmpty
                  ? const Center(
                      child: Text("No se ha encontrado ningún pedido."))
                  : Expanded(
                      child: ListView.builder(
                        itemCount: pedidoProvider.pedidos.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 4,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: ListTile(
                              title: Text(
                                  "Pedido Numero: ${pedidoProvider.pedidos[index].getNumeroPedido()}"),
                              subtitle: Text(
                                  "${pedidoProvider.pedidos[index].getDescripcion()}\nPrecio: ${pedidoProvider.pedidos[index].getPrecio()}"),
                              isThreeLine: true,
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Column(
                                    children: [
                                      //Text("Precio: ${todosPedidos[index].getPrecio()}"),
                                      Text(
                                          "Estado: ${pedidoProvider.pedidos[index].getEstado()}"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
