import 'package:flutter/material.dart';
import 'package:flutter_proyecto/utils/button_styles.dart';

class PantallaYo extends StatefulWidget {
  const PantallaYo({super.key});

  @override
  State<PantallaYo> createState() => _PantallaYoState();
}

class _PantallaYoState extends State<PantallaYo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Text("Implementar la pantalla Yo"),
          SizedBox(height: 30,),
          ElevatedButton.icon(
            style: CustomButtonStyles.botonesDefecto,
            icon: Icon(Icons.email),
            onPressed: () {
              //Pantalla Mis pedidos
            }, 
            label: Text("Contacto"),
          ),
          SizedBox(height: 30,),
          ElevatedButton.icon(
            style: CustomButtonStyles.botonesDefecto,
            icon: Icon(Icons.account_circle),
            onPressed: () {
              //Pantalla Mis pedidos
            }, 
            label: Text("Editar usuario"),
          ),
          /*
          SizedBox(height: 30,),
          ElevatedButton.icon(
            style: CustomButtonStyles.botonesDefecto,
            icon: Icon(Icons.report_problem),
            onPressed: () {
              //Pantalla Incidencias -> Ver usuario
            }, 
            label: Text("Ver usuario"),
          ),
          */
        ],
      ),
    );
  }
}