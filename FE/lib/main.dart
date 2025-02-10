import 'package:flutter/material.dart';
import 'package:flutter_proyecto/providers/PedidoProvider.dart';
import 'package:flutter_proyecto/providers/ProductoProvider.dart';
import 'package:flutter_proyecto/providers/UsuarioProvider.dart';
import 'screens/Login/PantallaInicioSesion.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => UsuarioProvider()..fetchUsuarios()),
        ChangeNotifierProvider(
            create: (context) => ProductoProvider()..fetchProductos()),
        ChangeNotifierProvider(
            create: (context) => PedidoProvider()..fetchPedidos()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 91, 155, 207),
        ),
        useMaterial3: true,
      ),
      home: const PantallaInicioSesion(),
    );
  }
}
