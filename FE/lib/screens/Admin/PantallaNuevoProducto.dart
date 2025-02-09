import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto/data/models/productos.dart';
import 'package:flutter_proyecto/data/repositories/ProductoRepository.dart';
import 'package:flutter_proyecto/providers/ProductoProvider.dart';
import 'package:flutter_proyecto/providers/UsuarioProvider.dart';
import 'package:flutter_proyecto/services/LogicaProductos.dart';
import 'package:flutter_proyecto/utils/button_styles.dart';
import 'package:flutter_proyecto/widgets/drawers.dart';
import 'package:provider/provider.dart';
//import 'package:image_picker/image_picker.dart';

class NuevoProducto extends StatefulWidget {
  const NuevoProducto({super.key});

  @override
  State<NuevoProducto> createState() => _NuevoProductoState();
}

class _NuevoProductoState extends State<NuevoProducto> {
  final _formKey = GlobalKey<FormState>();
  //final ProductoRepository _productoRepository = ProductoRepository();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();
  File? _imagen; // Variable para almacenar la imagen seleccionada

  // Método para seleccionar imagen
  Future<void> _seleccionarImagen() async {
    /*
    final ImagePicker picker = ImagePicker();
    final File? imagenSeleccionada = await picker.pickImage(source: ImageSource.gallery);


    if (imagenSeleccionada != null) {
      setState(() {
        _imagen = File(imagenSeleccionada.path);
      });
    }
    */
  }

  // Método para guardar el producto
  void _guardarProducto() {
    if (_formKey.currentState!.validate()) {
      final productoProvider =
          Provider.of<ProductoProvider>(context, listen: false);

      final producto = Productos(
        nombre: _nombreController.text,
        descripcion: _descripcionController.text,
        //imagenPath: _imagen!.path,
        imagenPath: "assets/images/logo.png",
        stock: int.parse(_stockController.text),
        precio: double.parse(_precioController.text),
      );

      productoProvider.addProducto(producto);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Producto agregado correctamente")),
      );

      // Limpiar los campos después de guardar
      _nombreController.clear();
      _descripcionController.clear();
      _stockController.clear();
      _precioController.clear();
      setState(() {
        _imagen = null;
      });
    } /* else if (_imagen == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Por favor, selecciona una imagen")),
      );
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerGeneral(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Gestión de Usuarios"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: "Nombre del producto",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "El nombre no puede estar vacío";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _descripcionController,
                decoration: const InputDecoration(
                  labelText: "Descripción",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "La descripción no puede estar vacía";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _precioController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Precio de venta",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "El producto tiene que tener un valor";
                  }
                  if (int.tryParse(value) == null) {
                    return "Introduce un número válido";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _stockController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Stock disponible",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "El stock no puede estar vacío";
                  }
                  if (int.tryParse(value) == null) {
                    return "Introduce un número válido";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Center(
                child: Column(
                  children: [
                    _imagen != null
                        ? Image.file(_imagen!,
                            height: 100, width: 100, fit: BoxFit.cover)
                        : const Icon(Icons.image,
                            size: 100, color: Colors.grey),
                    TextButton.icon(
                      onPressed: _seleccionarImagen,
                      icon: const Icon(Icons.add_a_photo),
                      label: const Text("Seleccionar Imagen"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      style: CustomButtonStyles.botonesDefecto,
                      onPressed: _guardarProducto,
                      child: const Text("Guardar Producto"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: CustomButtonStyles.botonesDefecto,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Volver"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      /*
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text("No se ha encontrado ningún usuario."),
            SizedBox(height: 20,),
            ElevatedButton(
              style: CustomButtonStyles.botonesDefecto,
              onPressed: _anadirProducto, 
              child: Text("Aceptar"),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              style: CustomButtonStyles.botonesDefecto,
              onPressed: () {
                Navigator.pop(context);
              }, 
              child: Text("Volver"),
            )
          ],
        ),
      ),
      */
    );
  }
}
