import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto/models/pedidos.dart';
import 'package:flutter_proyecto/models/productos.dart';
import 'package:flutter_proyecto/services/LogicaPedidos.dart';
import 'package:flutter_proyecto/services/LogicaProductos.dart';

class PantallaCompras extends StatefulWidget {
  const PantallaCompras({super.key, required this.nombreUsuario});

  final String nombreUsuario;

  @override
  State<PantallaCompras> createState() => _PantallaComprasState();
}

class _PantallaComprasState extends State<PantallaCompras> {
  // Usamos un mapa para almacenar la cantidad seleccionada de cada producto.
  Map<int, int> cantidades = {};
  String _mensajeCompra = "";
  double _precioTotal = 0.0;

  // Método para modificar la cantidad (aumentar o disminuir)
  void _modificarCantidad(int index, int cambio) {
    setState(() {
      int nuevaCantidad = cantidades[index]! + cambio;
      // Aseguramos que la cantidad no sea negativa
      if (nuevaCantidad >= 0) {
        cantidades[index] = nuevaCantidad;
      }
    });
  }

  void _realizarCompra() {
    // Filtramos los productos que tienen cantidad mayor a 0
    List<String> productosComprados = [];
    cantidades.forEach((index, cantidad) {
      // if (cantidad > 0) {
      //   productosComprados.add("${cantidad}x ${LogicaProductos.getListaProductos()[index].getNombre()}");
      //   _precioTotal = cantidad * LogicaProductos.getListaProductos()[index].getPrecio();
      // }
    });

    if (productosComprados.isEmpty) {
      // Si no se ha seleccionado ningún producto, mostramos un mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No has seleccionado ningún producto.")),
      );
      return;
    }

    // Construimos el mensaje con los productos comprados
    _mensajeCompra = productosComprados.join("\n");

    // Mostramos el diálogo de confirmación
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmar Compra"),
          content: Text(
              "Has seleccionado los siguientes productos:\n\n$_mensajeCompra"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: const Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
                _procesarCompra(); // Llama a la función para procesar la compra
              },
              child: const Text("Confirmar"),
            ),
          ],
        );
      },
    );
  }

  void _procesarCompra() {
    setState(() {
      List<Productos> listaProductos =
          LogicaProductos.getListaProductos() as List<Productos>;
      cantidades.forEach((index, cantidad) {
        if (cantidad > 0) {
          // Restamos el stock del producto comprado
          Productos miProducto = listaProductos[index];
          miProducto.setStock(miProducto.stock - cantidad);
        }
      });

      // Reseteamos la selección de cantidades
      cantidades.clear();
    });

    // Crear un objeto User
    Pedidos pedido = Pedidos(
      comprador: widget.nombreUsuario,
      estado: "Pedidos",
      numeroPedido: Random().nextInt(10000),
      precio: _precioTotal,
      descripcion: _mensajeCompra,
    );

    LogicaPedidos.anadirPedido(pedido);

    // Mostrar mensaje de éxito
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Compra realizada con éxito")),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Productos> todosProductos =
        LogicaProductos.getListaProductos() as List<Productos>;
    return Padding(
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
                      if (!cantidades.containsKey(index)) {
                        cantidades[index] = 0;
                      }
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
                                icon:
                                    const Icon(Icons.remove, color: Colors.red),
                                onPressed: () {
                                  _modificarCantidad(index, -1);
                                },
                              ),
                              Text("${cantidades[index]}",
                                  style: const TextStyle(fontSize: 18)),
                              IconButton(
                                icon:
                                    const Icon(Icons.add, color: Colors.green),
                                onPressed: () {
                                  _modificarCantidad(index, 1);
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
          ElevatedButton.icon(
              onPressed: () {
                _realizarCompra();
              },
              icon: const Icon(Icons.shopping_cart),
              label: const Text("Realizar compra")),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
