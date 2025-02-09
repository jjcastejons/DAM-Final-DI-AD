import 'package:flutter/material.dart';
import 'package:flutter_proyecto/data/models/productos.dart';
import 'package:flutter_proyecto/data/repositories/ProductoRepository.dart';

class ProductoProvider with ChangeNotifier {
  final ProductoRepository _productoRepository = ProductoRepository();
  List<Productos> _productos = [];

  List<Productos> get productos => _productos;

  Future<void> fetchProductos() async {
    _productos = await _productoRepository.getListaProductos();
    notifyListeners();
  }

  Future<void> addProducto(Productos producto) async {
    await _productoRepository.anadirProducto(producto);
    fetchProductos();
  }

  Future<void> updateProducto(String id, Productos producto) async {
    await _productoRepository.actualizarProducto(id, producto);
    fetchProductos();
  }

  Future<void> deleteProducto(String id) async {
    await _productoRepository.eliminarProducto(id);
    fetchProductos();
  }
}
