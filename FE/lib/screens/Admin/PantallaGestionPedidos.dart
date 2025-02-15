import 'package:flutter/material.dart';
import 'package:flutter_proyecto/providers/PedidoProvider.dart';
import 'package:flutter_proyecto/widgets/drawers.dart';
import 'package:provider/provider.dart';

import '../../data/models/pedidos.dart';

class GestionPedidos extends StatefulWidget {
  const GestionPedidos({super.key});

  @override
  State<GestionPedidos> createState() => _GestionPedidosState();
}

class _GestionPedidosState extends State<GestionPedidos> {
  void _modificarEstado(
      PedidoProvider pedidoProvider, int index, Pedidos pedido) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Modificar Estado del Pedido"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Selecciona un nuevo estado para este pedido:"),
              const SizedBox(height: 10),
              DropdownButton<String>(
                value: pedido.getEstado(),
                isExpanded: true,
                onChanged: (String? newValue) {
                  setState(() {
                    pedido.setEstado(newValue ?? "");
                  });
                },
                items: ["Pedido", "Producción", "Enviado", "Entregado"]
                    .map((estado) => DropdownMenuItem(
                          value: estado,
                          child: Text(estado),
                        ))
                    .toList(),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo sin guardar
              },
              child: const Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () {
                pedidoProvider.updatePedido(pedido.numeroPedido, pedido);
                Navigator.of(context).pop(); // Cerrar el diálogo
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Estado cambiado")),
                );
              },
              child: const Text("Guardar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerGeneral(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Gestión de Pedidos"),
      ),
      body: Consumer<PedidoProvider>(
        builder: (context, pedidoProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Verificar si hay pedidos
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
                                    "Pedido de ${pedidoProvider.pedidos[index].getComprador()} Numero: ${pedidoProvider.pedidos[index].getNumeroPedido()}"),
                                subtitle: Text(
                                    "${pedidoProvider.pedidos[index].getDescripcion()}\nPrecio: ${pedidoProvider.pedidos[index].getPrecio()}"),
                                isThreeLine: true,
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Column(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              _modificarEstado(
                                                  pedidoProvider,
                                                  index,
                                                  pedidoProvider
                                                      .pedidos[index]);
                                            },
                                            icon: Icon(Icons.edit)),
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
      ),
    );
  }
}
