import 'package:flutter/material.dart';
import 'package:flutter_proyecto/data/models/productos.dart';
import 'package:flutter_proyecto/data/repositories/ProductoRepository.dart';
import 'package:flutter_proyecto/screens/Admin/PantallaNuevoProducto.dart';
import 'package:flutter_proyecto/services/LogicaProductos.dart';
import 'package:flutter_proyecto/utils/button_styles.dart';
import 'package:flutter_proyecto/widgets/drawers.dart';

class PantallaProductos extends StatefulWidget {
  const PantallaProductos({super.key});

  @override
  State<PantallaProductos> createState() => _PantallaProductosState();
}

class _PantallaProductosState extends State<PantallaProductos> {
  List<Productos> todosProductos = [];
  final ProductoRepository _productoRepository = ProductoRepository();
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

  @override
  void initState() {
    super.initState();
    _productoRepository.getListaProductos().then((result) {
      setState(() {
        todosProductos = result; // Update state when data is loaded
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
            todosProductos.isEmpty
                ? const Center(
                    child: Text("No se ha encontrado ningún producto."))
                : Expanded(
                    child: ListView.builder(
                      itemCount: todosProductos.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: ListTile(
                            /*
                          leading: Image.asset(
                            todosProductos[index].getNombre(),
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => 
                              const Icon(Icons.image, size: 50),
                          ),
                          */
                            title: Text(todosProductos[index].getNombre()),
                            subtitle: Text(
                                "Precio: ${todosProductos[index].getPrecio()}\nStock: ${todosProductos[index].getStock()}\n${todosProductos[index].getDescripcion()}"),
                            isThreeLine: true,
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit,
                                      color: Colors.blue),
                                  onPressed: () {
                                    _editarProducto(
                                        context, todosProductos[index], index);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () {
                                    _eliminarProducto(index);
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
                ).then((_) => setState(
                    () {})); // Solución: Actualizar la pantalla después de agregar un producto
              },
              child: const Text("Añadir producto"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: CustomButtonStyles.botonesDefecto,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Volver"),
            ),
            const SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}
