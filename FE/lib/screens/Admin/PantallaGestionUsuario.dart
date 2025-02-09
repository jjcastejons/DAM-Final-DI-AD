import 'package:flutter/material.dart';
import 'package:flutter_proyecto/data/models/user.dart';
import 'package:flutter_proyecto/data/repositories/UsuarioRepository.dart';
import 'package:flutter_proyecto/screens/Admin/PantallaRegistroAdmin.dart';
import 'package:flutter_proyecto/services/LogicaUsuarios.dart';
import 'package:flutter_proyecto/utils/button_styles.dart';
import 'package:flutter_proyecto/widgets/drawers.dart';

class PantallaGestionUsers extends StatefulWidget {
  const PantallaGestionUsers({super.key});

  @override
  State<PantallaGestionUsers> createState() => _PantallaGestionUsersState();
}

class _PantallaGestionUsersState extends State<PantallaGestionUsers> {
  // void _eliminarUsuario(int index) {
  //   setState(() {
  //     LogicaUsuarios.getListaUsuarios().removeAt(index);
  //   });

  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(content: Text("Producto eliminado correctamente")),
  //   );
  // }

  void _bloquearUsuario(BuildContext context, User usuario, int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Función de bloqueo aún no implementada")),
    );
  }

  void _editarUsuario(BuildContext context, User usuario, int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Función de edición aún no implementada")),
    );
  }

  @override
  Widget build(BuildContext context) {
    final UsuarioRepository _usuarioRepository = UsuarioRepository();
    dynamic todosUsuarios;
    _usuarioRepository.getListaUsuarios().then((data) => todosUsuarios = data);
    return Scaffold(
      drawer: const DrawerGeneral(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Gestión de Usuarios"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Verificar si hay productos
            todosUsuarios.isEmpty
                ? const Center(
                    child: Text("No se ha encontrado ningún producto."))
                : Expanded(
                    child: ListView.builder(
                      itemCount: todosUsuarios.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: ListTile(
                            /*
                          leading: Image.asset(
                            todosUsuarios[index].getImage(),
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => 
                              const Icon(Icons.image, size: 50),
                          ),
                          */
                            title: Text(todosUsuarios[index].getNombre()),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit,
                                      color: Colors.blue),
                                  onPressed: () {
                                    _editarUsuario(
                                        context, todosUsuarios[index], index);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.block,
                                      color: Colors.black),
                                  onPressed: () {
                                    _bloquearUsuario(
                                        context, todosUsuarios[index], index);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () {
                                    // _eliminarUsuario(index);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: CustomButtonStyles.botonesDefecto,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PantallaRegistroAdmin()));
              },
              child: const Text("Nuevo usuario"),
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
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
