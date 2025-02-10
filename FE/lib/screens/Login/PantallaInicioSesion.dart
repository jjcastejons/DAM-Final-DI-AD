import 'package:flutter/material.dart';
import 'package:flutter_proyecto/data/models/user.dart';
import 'package:flutter_proyecto/providers/UsuarioProvider.dart';
import 'package:flutter_proyecto/screens/Admin/PantallaAdmin.dart';
import 'package:flutter_proyecto/screens/Usuario/PantallaUsuario.dart';
import 'package:flutter_proyecto/screens/Login/PantallaRegistro.dart';
import 'package:flutter_proyecto/utils/button_styles.dart';
import 'package:provider/provider.dart';

class PantallaInicioSesion extends StatefulWidget {
  const PantallaInicioSesion({super.key});

  @override
  State<PantallaInicioSesion> createState() => _PantallaPrincipal();
}

class _PantallaPrincipal extends State<PantallaInicioSesion> {
  //final _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String text = "Esta es mi pantalla principal";
  String _nombre = '';
  String _contrasena = '';
  bool cambiado = true;

  Future<void> _pantallaInicio() async {
    final usuarioProvider =
        Provider.of<UsuarioProvider>(context, listen: false);
    List<User> listaUsuarios = await usuarioProvider.fetchListaUsuarios();
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }

    for (User miUsuario in listaUsuarios) {
      if (miUsuario.getNombre() == _nombre &&
          miUsuario.getPass() == _contrasena) {
        if (miUsuario.getAdministrador() == false) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PantallaUsuario(
                nombreUsuario: _nombre,
              ),
            ),
          );
          break;
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PantallaAdmin(),
            ),
          );
        }
      }
    }

    if (_nombre == 'admin' && _contrasena == 'admin') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const PantallaAdmin()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuario o Contraseña incorrecta')),
      );
    }
  }

  void _pantallaRegistro() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const PantallaRegistro()));
  }

  void _mostrarContrasena(
      BuildContext context, String nombre, String contrasena) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Contraseña del usuario $nombre"),
          content: Column(
            mainAxisSize:
                MainAxisSize.min, // Evita que el diálogo ocupe toda la pantalla
            children: [
              Text(contrasena),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Cierra el diálogo después de enviar
              },
              child: const Text("Aceptar"),
            ),
          ],
        );
      },
    );
  }

  void _mostrarDialogoRecuperacion(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController nombreRecuperado = TextEditingController();
        return AlertDialog(
          title: const Text("Recuperar Contraseña"),
          content: Column(
            mainAxisSize:
                MainAxisSize.min, // Evita que el diálogo ocupe toda la pantalla
            children: [
              //const Text("Introduce tu nombre de usuario"),
              const SizedBox(height: 10),
              TextField(
                controller: nombreRecuperado,
                decoration: const InputDecoration(
                  labelText: "Nombre de usuario",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: const Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                for (User miUsuario in usuarioProvider.usuarios) {
                  if (miUsuario.getNombre() == nombreRecuperado.toString()) {
                    String contrasenaRacuperada = miUsuario.getPass();
                    _mostrarContrasena(context, nombreRecuperado.toString(),
                        contrasenaRacuperada);
                    break;
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Usuario o Contraseña incorrecta')),
                    );
                  }
                }
              },
              child: const Text("Enviar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Pantalla Principal"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 75.0, right: 75.0, top: 50.0),
                child: Image.asset(
                  'assets/images/logo.png',
                ),
              ),
              const SizedBox(
                width: 20,
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Nombre',
                          hintText: 'Introduce tu nombre',
                          border: OutlineInputBorder(),
                        ),
                        //maxLength: 50,
                        //initialValue: "Nombre",
                        onSaved: (nombre) {
                          print('saved $nombre');
                          _nombre = nombre!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'El campo no puede estar vacío';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      TextFormField(
                        //initialValue: "Contraseña",
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Contraseña',
                          hintText: 'Introduce tu contraseña',
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (contrasena) {
                          print('saved $contrasena');
                          _contrasena = contrasena!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'El campo no puede estar vacío';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 50,
                height: 50,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: _pantallaInicio,
                  style: CustomButtonStyles.botonesDefecto,
                  child: const Text("Iniciar Sesión"),
                ),
              ),
              const SizedBox(
                width: 20,
                height: 20,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: _pantallaRegistro,
                  style: CustomButtonStyles.botonesDefecto,
                  child: const Text("Registrarse"),
                ),
              ),
              const SizedBox(
                width: 20,
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  _mostrarDialogoRecuperacion(context);
                },
                child: const Text(
                  "¿Olvidaste tu contraseña?",
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
