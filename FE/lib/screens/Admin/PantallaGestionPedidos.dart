import 'package:flutter/material.dart';
import 'package:flutter_proyecto/models/pedidos.dart';
import 'package:flutter_proyecto/services/LogicaPedidos.dart';
import 'package:flutter_proyecto/widgets/drawers.dart';

class GestionPedidos extends StatefulWidget {
  const GestionPedidos({super.key});

  @override
  State<GestionPedidos> createState() => _GestionPedidosState();
}

class _GestionPedidosState extends State<GestionPedidos> {
  @override
  Widget build(BuildContext context) {
    List<Pedidos> todosPedidos = LogicaPedidos.getListaPedidos();
    return Scaffold(
      drawer: const DrawerGeneral(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Gestión de Productos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Verificar si hay productos
            todosPedidos.isEmpty
              ? const Center(child: Text("No se ha encontrado ningún producto."))
              : Expanded( 
                  child: ListView.builder(
                    itemCount: todosPedidos.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: ListTile(
                          title: Text("Pedido de ${todosPedidos[index].getComprador()} Numero: ${todosPedidos[index].getNumeroPedido()}"),
                          subtitle: Text("${todosPedidos[index].getDescripcion()}\nPrecio: ${todosPedidos[index].getPrecio()}"),
                          isThreeLine: true,
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                children: [
                                  //Text("Precio: ${todosPedidos[index].getPrecio()}"),
                                  //Text("Usuario: ${todosPedidos[index].getComprador()}"),
                                  Text("Estado: ${todosPedidos[index].getEstado()}"),
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
      ),
    );
  }
}