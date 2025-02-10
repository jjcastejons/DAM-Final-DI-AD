import 'package:flutter/material.dart';
import 'package:flutter_proyecto/providers/PedidoProvider.dart';
import 'package:flutter_proyecto/widgets/drawers.dart';
import 'package:provider/provider.dart';

class GestionPedidos extends StatefulWidget {
  const GestionPedidos({super.key});

  @override
  State<GestionPedidos> createState() => _GestionPedidosState();
}

class _GestionPedidosState extends State<GestionPedidos> {
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
                                        //Text("Precio: ${todosPedidos[index].getPrecio()}"),
                                        //Text("Usuario: ${todosPedidos[index].getComprador()}"),
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
      ),
    );
  }
}
