import 'package:flutter/material.dart';
import 'package:flutter_proyecto/data/models/productos.dart';
import 'package:flutter_proyecto/providers/ProductoProvider.dart';
import 'package:flutter_proyecto/screens/Admin/PantallaNuevoProducto.dart';
import 'package:flutter_proyecto/utils/button_styles.dart';
import 'package:flutter_proyecto/widgets/drawers.dart';
import 'package:provider/provider.dart';

class PantallaProductos extends StatefulWidget {
  const PantallaProductos({super.key});

  @override
  State<PantallaProductos> createState() => _PantallaProductosState();
}

class _PantallaProductosState extends State<PantallaProductos> {
  void _eliminarProducto(int index) {
    setState(() {
      //LogicaProductos.getListaProductos().removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Producto eliminado correctamente")),
    );
  }

  void _editarProducto(BuildContext context, Productos producto, int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Función de edición aún no implementada")),
    );
  }

  /// Se agrega un consumer para que actualize los cambios cuando estos sean detectados en el provider
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerGeneral(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Gestión de Productos"),
      ),
      body: Consumer<ProductoProvider>(
        builder: (context, productoProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                productoProvider.productos.isEmpty
                    ? const Center(
                        child: Text("No se ha encontrado ningún producto."))
                    : Expanded(
                        child: ListView.builder(
                          itemCount: productoProvider.productos.length,
                          itemBuilder: (context, index) {
                            final producto = productoProvider.productos[index];
                            return Card(
                              elevation: 4,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              child: ListTile(
                                title: Text(producto.getNombre()),
                                subtitle: Text(
                                    "Precio: ${producto.getPrecio()}\nStock: ${producto.getStock()}\n${producto.getDescripcion()}"),
                                isThreeLine: true,
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit,
                                          color: Colors.blue),
                                      onPressed: () {
                                        _editarProducto(
                                            context, producto, index);
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red),
                                      onPressed: () {
                                        productoProvider
                                            .deleteProducto(producto.id);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: CustomButtonStyles.botonesDefecto,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NuevoProducto()),
                    ).then((_) => productoProvider
                        .fetchProductos()); // Recargar productos
                  },
                  child: const Text("Añadir producto"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
