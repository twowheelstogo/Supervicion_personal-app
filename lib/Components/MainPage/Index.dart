import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:control_empleados/Components/MainPage/Presentacion.dart';
import 'package:control_empleados/Components/MainPage/Cartas.dart';
import 'package:control_empleados/Components/MainPage/Metodos.dart';
import 'package:intl/intl.dart';
import 'package:control_empleados/Components/Constants/Index.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  MainPage_ createState() {
    return new MainPage_();
  }
}

class MainPage_ extends State<MainPage> {
    
TextEditingController UsuarioBusqueda = TextEditingController();
  TextEditingController RegionBusqueda = TextEditingController();

  void initState() {
    UsuarioBusqueda.text = ""; //innitail value of text field
    RegionBusqueda.text = "";
    super.initState();
  }
  String now = DateFormat("yyyy-MM-dd").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Presentacion(),
              Column(children: [
      Container(
          color: HexColor('#f16623'),
          width: double.infinity,
          height: MediaQuery.of(context).size.width * 0.50,
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFieldDinamico__(
                      UsuarioBusqueda, 'Usuario', 'UsuarioB')),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFieldDinamico__(
                      RegionBusqueda, 'Macroregión', 'Region')),
            ],
          ))
    ]),
        for (var i in Principal().DataEmpleados(
            UsuarioBusqueda.text.toString(), RegionBusqueda.text.toString()))
          Cartas(
              i.Nombre, i.Agencia, i.urlFoto, i.Genero, now, i.Estado, i.Tiempo,i.Region)
      ],
    )));
  }


Widget TextFieldDinamico__(
      TextEditingController controlador, String Label, String Llave) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: TextField(
                        onChanged: (text) => Principal()
                            .storage_(Llave, controlador.text.toString()),
                        controller: controlador,
                        cursorColor: HexColor(ColorPrincipal),
                        style: TextStyle(color: HexColor(ColorPrincipal)),
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: HexColor(ColorPrincipal), width: 4.5),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: HexColor(ColorPrincipal), width: 4.5),
                          ),
                          labelStyle: TextStyle(
                              color: HexColor(ColorPrincipal), fontSize: 22),
                          labelText: Label,
                          prefixIcon: Icon(Icons.manage_search_sharp,
                              color: HexColor(
                                  ColorPrincipal)), //icon at head of input
                        )),
                  ),
                ],
              ))
            ],
          ),
        )
      ],
    );
  }

}
