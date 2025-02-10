class Pedidos {
  final int numeroPedido;
  final String descripcion;
  final double precio;
  final String estado;
  final String comprador;

  Pedidos({
    required this.numeroPedido,
    required this.descripcion,
    required this.precio,
    required this.estado,
    required this.comprador,
  });

  @override
  String toString() {
    return 'Productos(Numero Producto: $numeroPedido, precio: $descripcion, estado: $estado, comprador: $comprador)';
  }

  int getNumeroPedido() {
    return numeroPedido;
  }

  String getDescripcion() {
    return descripcion;
  }

  double getPrecio() {
    return precio;
  }

  String getEstado() {
    return estado;
  }

  String getComprador() {
    return comprador;
  }

  // Convierte un JSON a un objeto Pedidos
  factory Pedidos.fromJson(Map<String, dynamic> json) {
    return Pedidos(
        numeroPedido: json['numeroPedido'] ?? '',
        descripcion: json['descripcion'] ?? '',
        precio: json['precio'] ?? 0.0,
        estado: json['estado'] ?? '',
        comprador: json['comprador'] ?? '');
  }

  // Objeto Pedidos a JSON
  Map<String, dynamic> toJson() {
    return {
      "numeroPedido": numeroPedido,
      "descripcion": descripcion,
      "precio": precio,
      "estado": estado,
      "comprador": comprador,
    };
  }
}
