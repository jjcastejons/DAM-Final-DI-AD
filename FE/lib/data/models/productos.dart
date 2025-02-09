class Productos {
  final String nombre;
  final String descripcion;
  final String imagenPath;
  final int stock;
  final double precio;

  Productos({
    required this.nombre,
    required this.descripcion,
    required this.imagenPath,
    required this.stock,
    required this.precio,
  });

  @override
  String toString() {
    return 'Productos(nombre: $nombre, descripcion: $descripcion, imagen: $imagenPath, stock: $stock)';
  }

  String getNombre() {
    return nombre;
  }

  String getDescripcion() {
    return descripcion;
  }

  String getImagen() {
    return imagenPath;
  }

  int getStock() {
    return stock;
  }

  double getPrecio() {
    return precio;
  }

  void setStock(int stock) {
    stock = stock;
  }

  // Convierte un JSON a un objeto Productos
  factory Productos.fromJson(Map<String, dynamic> json) {
    return Productos(
        nombre: json['nombre'] ?? '',
        descripcion: json['descripcion'] ?? '',
        imagenPath: json['imagenPath'] ?? '',
        stock: json['stock'] ?? 0,
        precio: json['precio'] ?? 0.0);
  }

  // Objeto Productos a JSON
  Map<String, dynamic> toJson() {
    return {
      "nombre": nombre,
      "descripcion": descripcion,
      "imagenPath": imagenPath,
      "stock": stock,
      "precio": precio,
    };
  }
}
