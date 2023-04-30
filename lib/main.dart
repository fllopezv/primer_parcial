import 'package:flutter/material.dart';
import 'package:acceso_registro/screen/acceso_registro.dart';

void main() {
  runApp(AccesoRegistro());
}

class AccesoRegistro extends StatelessWidget {
  const AccesoRegistro({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Acceso y Registro",
      home: VistaAccesoRegistro(),
    );
  }
}
