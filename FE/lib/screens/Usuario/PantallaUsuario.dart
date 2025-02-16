import 'package:flutter/material.dart';
import 'package:flutter_proyecto/screens/Usuario/PantallaPedidos.dart';
import 'package:flutter_proyecto/screens/Usuario/PantallaCompras.dart';
import 'package:flutter_proyecto/screens/Login/PantallaInicioSesion.dart';
import 'package:flutter_proyecto/screens/Usuario/PantallaYo.dart';
import 'package:flutter_proyecto/widgets/drawers.dart';

class PantallaUsuario extends StatefulWidget {
  const PantallaUsuario({super.key, required this.nombreUsuario});

  final String nombreUsuario;

  @override
  State<PantallaUsuario> createState() => _PantallaSecundaria();
}

class _PantallaSecundaria extends State<PantallaUsuario> {

  var selectedBar = 0;

  void _pantallaPrincipal(){
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => PantallaInicioSesion())
    );
  }

  void _salir(){
    //
  }

  @override
  Widget build(BuildContext context) {

    Widget page;
    
    switch (selectedBar) { //selectedIndex
      case 0:
        page = PantallaCompras(nombreUsuario: widget.nombreUsuario);
        break;
      case 1:
        page = PantallaPedidos(nombreUsuario: widget.nombreUsuario,);
        break;
      case 2:
        page = PantallaYo();
        break;
      default:
        throw UnimplementedError('no widget for $selectedBar');
    }

    return Scaffold(
      drawer: DrawerGeneral(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Bienvenido ${widget.nombreUsuario}"),
      ),
      body: Center(
        child: page,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        currentIndex: selectedBar,
        onTap: (value) {
          setState(() {
            selectedBar = value;
          });
        },
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Pedidos',
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Yo',
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
        ]
      ),
    );
  }

}