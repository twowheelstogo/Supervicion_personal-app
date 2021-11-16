import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:control_empleados/Components/MainPage/Presentacion.dart';
import 'package:control_empleados/Components/MainPage/Mensaje.dart';
import 'package:control_empleados/Components/MainPage/Cartas.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  MainPage_ createState() {
    return new MainPage_();
  }
}

class MainPage_ extends State<MainPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Presentacion(),
        Mensaje(),
        Cartas()
      ],
    )));
  }
}
