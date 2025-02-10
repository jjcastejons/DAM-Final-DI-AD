import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_proyecto/screens/Admin/PantallaGestionPedidos.dart';
import 'package:flutter_proyecto/screens/Admin/PantallaGestionProductos.dart';
import 'package:flutter_proyecto/screens/Admin/PantallaGestionUsuario.dart';
import 'package:flutter_proyecto/screens/Login/PantallaInicioSesion.dart';
import 'package:flutter_proyecto/utils/button_styles.dart';
import 'package:flutter_proyecto/widgets/drawers.dart';

class PantallaAdmin extends StatefulWidget {
  const PantallaAdmin({super.key});

  @override
  State<PantallaAdmin> createState() => _PantallaSecundaria();
}

class _PantallaSecundaria extends State<PantallaAdmin> {
  void _pantallaPrincipal() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const PantallaInicioSesion()));
  }

  void _salir() {
    SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerGeneral(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Administrador"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              style: CustomButtonStyles.botonesDefecto,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PantallaGestionUsers()));
              },
              label: const Text("Gestión de Usuarios"),
              icon: const Icon(Icons.people),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              style: CustomButtonStyles.botonesDefecto,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PantallaProductos()));
              },
              label: const Text("Gestión de Productos"),
              icon: const Icon(Icons.shopping_bag),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              style: CustomButtonStyles.botonesDefecto,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GestionPedidos()));
              },
              label: const Text("Gestión de Pedidos"),
              icon: const Icon(Icons.shopping_cart),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              style: CustomButtonStyles.botonesDefecto,
              onPressed: _pantallaPrincipal,
              label: const Text("Gestión de Inventario"),
              icon: const Icon(Icons.inventory),
            ),
            const SizedBox(
              height: 30,
            ),
            /*
            ElevatedButton.icon(
              style: CustomButtonStyles.botonesDefecto,
              onPressed: _pantallaPrincipal, 
              label: const Text("Gestión de Incidencias"),
              icon: const Icon(Icons.report_problem),
            ),
            SizedBox(height: 30,),
            */
          ],
        ),
      ),
    );
  }
}
