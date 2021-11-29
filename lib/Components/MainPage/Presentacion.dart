import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:control_empleados/Components/MainPage/Sesion.dart';
import 'package:control_empleados/Components/Constants/Index.dart';

class Presentacion extends StatefulWidget {
  const Presentacion({Key? key}) : super(key: key);
  @override
  Presentacion_ createState() {
    return new Presentacion_();
  }
}

class Presentacion_ extends State<Presentacion> {
  String NombreUsuario = "";

  Future<String> getName() async {
    final prefs = await SharedPreferences.getInstance();
    String Nombre = '';
    final res = prefs.getString('usuario');
    Nombre = '$res ';
    return Nombre;
  }

  Presentacion_() {
    getName().then((val) => setState(() {
          NombreUsuario = val;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          color: HexColor(ColorPrincipal),
          width: double.infinity,
          height: MediaQuery.of(context).size.width * 0.7,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.04,
                ),
                Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        alignment: Alignment.bottomRight, child: LogOut()),
                    // SizedBox(
                    // height: 100,
                    // ),

                    Container(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset("assets/images/TalenHub.PNG",
                            fit: BoxFit.fill, width: 65, height: 90)),

                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text('Bienvenido',
                          style: TextStyle(
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w700,
                              fontSize: 32,
                              color: HexColor("#FFFFFF"))),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(NombreUsuario,
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w300,
                              color: HexColor("#FFFFFF"))),
                    ),
                  ],
                ))
              ],
            ),
          )),
    ]);
  }
}
