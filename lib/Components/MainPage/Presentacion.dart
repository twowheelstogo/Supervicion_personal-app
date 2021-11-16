import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    return Column(        
          children: [
               Container(                    
                    color: HexColor('#6C63FF'),                    
                    width: double.infinity,
                    height: MediaQuery.of(context).size.width * 0.7,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                              height: 120,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text('Bienvenido',style: TextStyle(
                                  fontFamily: "InriaSans",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 50,color: HexColor("#FFFFFF"))),
                              ),
                               SizedBox(
                              height: 20,
                              ),  
                              Container(
                                alignment: Alignment.center,
                                child: Text(NombreUsuario,style: TextStyle(fontSize: 35,
                                fontFamily: "InriaSans",
                                  fontWeight: FontWeight.w300,
                                color: HexColor("#FFFFFF"))),
                              ),                             
                            ],
                          ))
                        ],
                      ),
                    )),                
            ]    
    );
  }
}
