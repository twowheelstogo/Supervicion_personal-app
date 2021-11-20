import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:control_empleados/Components/MainPage/Presentacion.dart';
import 'package:control_empleados/Components/MainPage/Mensaje.dart';
import 'package:control_empleados/Components/MainPage/Cartas.dart';
import 'package:control_empleados/Components/MainPage/Metodos.dart';
import 'package:intl/intl.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  MainPage_ createState() {
    return new MainPage_();
  }
}

class MainPage_ extends State<MainPage> {
  
  String now = DateFormat("yyyy-MM-dd").format(DateTime.now());
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Presentacion(),
        Mensaje(),
        for ( var i in Principal().DataEmpleados() ) Cartas(i.Nombre,i.Agencia,i.urlFoto,i.Genero,now,i.Estado,i.Tiempo) 
      ],
    )));
  }
}
