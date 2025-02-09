import 'package:flutter/material.dart';
import 'package:flutter_proyecto/data/models/pedidos.dart';
import 'package:flutter_proyecto/services/LogicaPedidos.dart';

class PantallaPedidos extends StatefulWidget {
  const PantallaPedidos({super.key, required this.nombreUsuario});

  final String nombreUsuario;

  @override
  State<PantallaPedidos> createState() => _PantallaPedidosState();
}

class _PantallaPedidosState extends State<PantallaPedidos> {
  @override
  Widget build(BuildContext context) {
    List<Pedidos> todosPedidos = LogicaPedidos.getListaPedidos();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          // Verificar si hay productos
          todosPedidos.isEmpty
              ? const Center(
                  child: Text("No se ha encontrado ningún producto."))
              : Expanded(
                  child: ListView.builder(
                    itemCount: todosPedidos.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: ListTile(
                          title: Text(
                              "Pedido Numero: ${todosPedidos[index].getNumeroPedido()}"),
                          subtitle: Text(
                              "${todosPedidos[index].getDescripcion()}\nPrecio: ${todosPedidos[index].getPrecio()}"),
                          isThreeLine: true,
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                children: [
                                  //Text("Precio: ${todosPedidos[index].getPrecio()}"),
                                  Text(
                                      "Estado: ${todosPedidos[index].getEstado()}"),
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
  }
}
