import 'package:flutter/material.dart';
import 'package:flutter_proyecto/data/models/user.dart';
import 'package:flutter_proyecto/providers/UsuarioProvider.dart';
import 'package:flutter_proyecto/screens/Admin/PantallaGestionUsuario.dart';
import 'package:flutter_proyecto/utils/button_styles.dart';
import 'package:provider/provider.dart';

class PantallaRegistroAdmin extends StatefulWidget {
  const PantallaRegistroAdmin({super.key});

  @override
  State<PantallaRegistroAdmin> createState() => _PantallaRegistroAdminState();
}

class _PantallaRegistroAdminState extends State<PantallaRegistroAdmin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _nombre = '';
  String _contrasena = '';
  String _contrasena2 = '';
  int _edad = 0;

  String _lugarNacimiento = "Zaragoza";
  final TextEditingController _edadController = TextEditingController();
  bool _aceptaTerminos = false;

  void _aceptar() {
    //Navigator.pop(context);
    if (_formKey.currentState!.validate()) {
      // Process data.
      _formKey.currentState!.save();
    }

    // Crear un objeto User
    User usuario = User(
      id: 0,
      nombre: _nombre,
      contrasena: _contrasena,
      contrasena2: _contrasena2,
      imagen: "assets/images/UsuarioIcono.jpg",
      edad: _edad,
      lugarNacimiento: _lugarNacimiento,
      administrador: _aceptaTerminos,
    );

    final usuarioProvider =
        Provider.of<UsuarioProvider>(context, listen: false);
    usuarioProvider.addUsuario(usuario);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Usuario guardado correctamente')),
    );

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const PantallaGestionUsers()));
  }

  void cancelar() => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    var tratamientoGrupo;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text(" Registros"),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 50.0, right: 50.0, top: 20),
                  child: Row(
                    children: [
                      const Text(
                        "Tratamiento:  ",
                        style: TextStyle(fontSize: 16),
                      ),
                      Radio<String>(
                        value: "Sr.",
                        groupValue: tratamientoGrupo,
                        onChanged: (value) {
                          setState(() {
                            //_tratamiento = true;
                          });
                        },
                      ),
                      const Text("Sr."),
                      Radio<String>(
                        value: "Sr.",
                        groupValue: tratamientoGrupo,
                        onChanged: (value) {
                          setState(() {
                            //_tratamiento = false;
                          });
                        },
                      ),
                      const Text("Sra."),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                  child: TextField(
                    //initialValue: "Nombre",
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                      hintText: 'Introduce tu nombre',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (newValue) => _nombre = newValue,
                    /*
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El campo no puede estar vacío';
                    }
                    return null;
                  },
                  */
                  ),
                ),
                const SizedBox(
                  height: 20,
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                  child: TextFormField(
                    obscureText: true, // Oculta los caracteres ingresados
                    decoration: const InputDecoration(
                      labelText: 'Contraseña',
                      hintText: 'Introduce tu contraseña',
                      border: OutlineInputBorder(),
                    ),
                    //initialValue: "Contraseña",
                    onSaved: (pass) {
                      _contrasena = pass!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El campo no puede estar vacío';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                  child: TextFormField(
                    //initialValue: "Repite la contraseña",
                    obscureText: true, // Oculta los caracteres ingresados
                    decoration: const InputDecoration(
                      labelText: 'Repite la contreseña',
                      hintText: 'Introduce de nuevo tu contraseña',
                      //hintText: 'Introduce tu contraseña',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (newValue) => _contrasena2 = newValue!,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El campo no puede estar vacío';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                  child: Row(
                    children: [
                      const Text(
                        "Añadir Imagen",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print("Cargar imagen");
                        },
                        child: const Text("Cargar Imagen"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                  child: TextFormField(
                    controller: _edadController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Edad",
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (newValue) => _edad = int.parse(newValue!),
                  ),
                ),
                const SizedBox(
                  height: 20,
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                  child: DropdownButtonFormField<String>(
                    value: _lugarNacimiento,
                    onChanged: (value) {
                      setState(() {
                        _lugarNacimiento = value!;
                      });
                    },
                    items: ["Zaragoza", "Madrid", "Barcelona", "Valencia"]
                        .map((lugar) => DropdownMenuItem(
                              value: lugar,
                              child: Text(lugar),
                            ))
                        .toList(),
                    decoration: const InputDecoration(
                      labelText: "Lugar de Nacimiento",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                  child: CheckboxListTile(
                    value: _aceptaTerminos,
                    onChanged: (value) {
                      setState(() {
                        _aceptaTerminos = value!;
                      });
                    },
                    title: const Text("Usuario administrador"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                  width: 20,
                ),
                ElevatedButton(
                    style: CustomButtonStyles.botonesDefecto,
                    onPressed: _aceptar,
                    child: const Text("Aceptar")),
                const SizedBox(
                  height: 20,
                  width: 20,
                ),
                ElevatedButton(
                  style: CustomButtonStyles.botonesDefecto,
                  onPressed: cancelar,
                  child: const Text("Cancelar"),
                ),
              ],
            ),
          ),
        ));
  }
}
