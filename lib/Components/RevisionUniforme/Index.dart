import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:control_empleados/Components/MainPage/Presentacion.dart';
import 'package:control_empleados/Components/MainPage/Mensaje.dart';
import 'package:control_empleados/Components/MainPage/Cartas.dart';
import 'package:control_empleados/Components/MainPage/Metodos.dart';
import 'package:control_empleados/Components/RevisionUniforme/men.dart';
import 'package:control_empleados/Components/RevisionUniforme/women.dart';

class RevisionUniforme extends StatelessWidget {
  final String NombreUsuario;
  final String Agencia;
  final String UrlFoto;
  final String Genero;

  const RevisionUniforme(this.NombreUsuario, this.Agencia, this.UrlFoto, this.Genero,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        Container(
           decoration: BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage("assets/images/FondoRevision.png"),
                fit: BoxFit.cover
            )
        ),
          child: (this.Genero == 'Masculino') ? Hombres(this.NombreUsuario, this.Agencia, this.UrlFoto, this.Genero) :
          Mujeres(this.NombreUsuario, this.Agencia, this.UrlFoto, this.Genero)     
        )        
    ]);
  }
}
