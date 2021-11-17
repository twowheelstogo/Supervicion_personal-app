import 'package:flutter/material.dart';

class Mujeres extends StatelessWidget {
  final String NombreUsuario;
  final String Agencia;
  final String UrlFoto;
  final String Genero;

  const Mujeres(
      this.NombreUsuario, this.Agencia, this.UrlFoto, this.Genero,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('Mujer')
    ]);
  }
}