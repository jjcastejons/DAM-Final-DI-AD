import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_proyecto/screens/Login/PantallaInicioSesion.dart';

class DrawerGeneral extends StatefulWidget {
  const DrawerGeneral({super.key});

  @override
  State<DrawerGeneral> createState() => _DrawerGeneralState();
}

class _DrawerGeneralState extends State<DrawerGeneral> {
  void _pantallaPrincipal() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const PantallaInicioSesion()));
  }

  void _salir() {
    SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300,
      //backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 300,
            height: 50,
            color: Colors.blue[300],
            child: const Text(
              textAlign: TextAlign.center,
              "Menú",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              size: 30,
            ),
            title: const Text(
              "Cerrar Sesión",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: _pantallaPrincipal,
          ),
          /*
          ListTile(
            leading: const Icon(Icons.person, size: 30,),
            title: const Text(
              "Mi Perfil",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: _pantallaPrincipal,
          ),
          ListTile(
            leading: const Icon(Icons.report_problem, size: 30,),
            title: const Text(
              "Reportar incidencia",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: _salir,
          ),
          */
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
              size: 30,
            ),
            title: const Text(
              "Salir",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: _salir,
          ),
        ],
      ),
    );
  }
}

class DrawerAdmin extends StatefulWidget {
  const DrawerAdmin({super.key});

  @override
  State<DrawerAdmin> createState() => _DrawerAdminState();
}

class _DrawerAdminState extends State<DrawerAdmin> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
