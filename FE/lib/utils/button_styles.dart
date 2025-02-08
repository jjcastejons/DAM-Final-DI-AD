import 'package:flutter/material.dart';

class CustomButtonStyles {
  /*
  static final ButtonStyle blueButton = ButtonStyle(
    minimumSize: const MaterialStatePropertyAll(Size(120, 50)),
  );

  static final ButtonStyle redButton = ButtonStyle(
    //backgroundColor: const MaterialStatePropertyAll(Colors.red),
    //foregroundColor: const MaterialStatePropertyAll(Colors.white),
    minimumSize: const MaterialStatePropertyAll(Size(150, 50)),
  );
  */

  static const ButtonStyle botonesDefecto = ButtonStyle(
    textStyle: WidgetStatePropertyAll(TextStyle(color:Color.fromARGB(255, 2, 39, 68), fontSize: 18)),
    //textStyle: MaterialStatePropertyAll(TextStyle()),
    minimumSize: WidgetStatePropertyAll(Size(250, 60)),
    side: WidgetStatePropertyAll(BorderSide(width: 1, color: Color.fromARGB(255, 2, 39, 68))),
    shadowColor: WidgetStatePropertyAll(Colors.black),
    overlayColor: WidgetStatePropertyAll(Color.fromARGB(255, 8, 53, 90))
  );

}