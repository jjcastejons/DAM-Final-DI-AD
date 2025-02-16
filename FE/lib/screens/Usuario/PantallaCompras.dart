import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto/data/models/pedidos.dart';
import 'package:flutter_proyecto/data/models/productos.dart';
import 'package:flutter_proyecto/providers/PedidoProvider.dart';
import 'package:flutter_proyecto/providers/ProductoProvider.dart';
import 'package:provider/provider.dart';

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
  late PedidoProvider _pedidoProvider;
  late ProductoProvider _productoProvider;

  @override
  void initState() {
    super.initState();
    _pedidoProvider = Provider.of<PedidoProvider>(context, listen: false);
    _productoProvider = Provider.of<ProductoProvider>(context, listen: false);
  }

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

    _precioTotal = 0.0;
    cantidades.forEach((index, cantidad) {
      if (cantidad > 0) {
        _productoProvider.productos[index]
            .setStock(_productoProvider.productos[index].stock - cantidad);
        productosComprados.add(
            "${cantidad} x ${_productoProvider.productos[index].getNombre()}");
        _precioTotal = _precioTotal +
            (cantidad * _productoProvider.productos[index].getPrecio());
      }
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
          title: Text("Precio Total $_precioTotal"),
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
    // Crear un objeto User

    PedidoProvider pedidoProvider =
        Provider.of<PedidoProvider>(context, listen: false);

    Pedidos pedido = Pedidos(
      comprador: widget.nombreUsuario,
      estado: "Pedido",
      numeroPedido: Random().nextInt(10000),
      precio: _precioTotal,
      descripcion: _mensajeCompra,
    );

    pedidoProvider.addPedido(pedido);

    setState(() {
      cantidades.forEach((index, cantidad) {
        if (cantidad > 0) {
          // Restamos el stock del producto comprado
          Productos miProducto = _productoProvider.productos[index];
          miProducto.setStock(miProducto.stock - cantidad);
        }
      });

      // Reseteamos la selección de cantidades
      cantidades.clear();
    });

    // Mostrar mensaje de éxito
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Compra realizada con éxito")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductoProvider>(
        builder: (context, productoProvider, child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Verificar si hay productos
            productoProvider.productos.isEmpty
                ? const Center(
                    child: Text("No se ha encontrado ningún producto."))
                : Expanded(
                    child: ListView.builder(
                      itemCount: productoProvider.productos.length,
                      itemBuilder: (context, index) {
                        if (!cantidades.containsKey(index)) {
                          cantidades[index] = 0;
                        }
                        return Card(
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: ListTile(
                            leading: Image.network(
                              productoProvider.productos[index].getImagen(),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.image, size: 50),
                            ),
                            title: Text(
                                productoProvider.productos[index].getNombre()),
                            subtitle: Text(
                                "Precio: ${productoProvider.productos[index].getPrecio()}\nStock: ${productoProvider.productos[index].getStock()}\n${productoProvider.productos[index].getDescripcion()}"),
                            isThreeLine: true,
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove,
                                      color: Colors.red),
                                  onPressed: () {
                                    _modificarCantidad(index, -1);
                                  },
                                ),
                                Text("${cantidades[index]}",
                                    style: TextStyle(fontSize: 18)),
                                IconButton(
                                  icon: const Icon(Icons.add,
                                      color: Colors.green),
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
                icon: Icon(Icons.shopping_cart),
                label: Text("Realizar compra")),
            const SizedBox(height: 20),
          ],
        ),
      );
    });
  }
}
