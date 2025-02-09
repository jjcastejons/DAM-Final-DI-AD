import 'package:flutter_proyecto/data/models/productos.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LogicaProductos {
  // Lista estática para almacenar los productos
  static final List<Productos> _listaProductos = [
    Productos(
        nombre: "Producto 1",
        descripcion: "Descripción del Producto 1",
        imagenPath: "assets/imagenes/Producto1.PNG",
        stock: 10,
        precio: 19.99),
    Productos(
        nombre: "Producto 2",
        descripcion: "Descripción del Producto 2",
        imagenPath: "assets/imagenes/Producto2.PNG",
        stock: 5,
        precio: 9.99),
    Productos(
        nombre: "Producto 3",
        descripcion: "Descripción del Producto 3",
        imagenPath: 'assets/images/Producto3.PNG',
        stock: 8,
        precio: 29.99),
  ];

  // Método para añadir un producto a la lista
  static void anadirProducto(Productos productos) {
    _listaProductos.add(productos);
  }

  // Método para obtener la lista de productos
  // static Future<List<Productos>> getListaProductos() {
  //   //return _listaProductos;
  //   return apiRequest('getall');
  // }

  // // TODO: Hay que pasar esta lógica a un servicio genérico que llame a la API
  // static Future<List<Productos>> apiRequest(String path) async {
  //   final url = Uri.parse('http://localhost:8080/api/v1/products/$path');
  //   try {
  //     final response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       List<dynamic> jsonList = jsonDecode(response.body);
  //       List<Productos> productos =
  //           jsonList.map((json) => Productos.fromJson(json)).toList();
  //       return productos;
  //     }
  //   } catch (e) {
  //     // Error conexión API
  //     print("error");
  //   }
  //   return [];
  // }
}
