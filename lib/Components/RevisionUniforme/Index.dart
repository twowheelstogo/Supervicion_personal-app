import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:control_empleados/Components/MainPage/Index.dart';

class RevisionUniforme extends StatelessWidget {
  final String NombreUsuario;
  final String Agencia;
  final String UrlFoto;
  final String Genero;
  final String now;

  const RevisionUniforme(
      this.NombreUsuario, this.Agencia, this.UrlFoto, this.Genero,this.now,
      {Key? key})
      : super(key: key);
  
  String GetUrl() {
    String url = "";
    if (this.Genero == 'Masculino') {
      url = "assets/images/Hombre.png";
    } else {
      url = "assets/images/Mujer.png";
    }
    return url;
  }

  @override
  Widget build(BuildContext context) {
    void Regresar() {
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => MainPage(),
        ),
      );
    }

    void Calificar(String tipo) {
      switch (tipo) {
        case 'Camisa':
          print('opcion 1');
          break;

        case 'Pantalon':
        print('opcion 2');
          break;

        case 'Zapatos':
        print('opcion 3');
          break;
      }
    }

    return Scaffold(
        body: Center(
            child: Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(GetUrl()), fit: BoxFit.cover)),
      child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                Container(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                        padding: EdgeInsets.only(right: 0.0),
                        child: ButtonTheme(
                          minWidth: 100.0,
                          height: 45.0,
                          child: RaisedButton(
                            textColor: HexColor('#FFFFFF'),
                            color: HexColor("#B3B4BC"),
                            child: Text(
                              "Regresar",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'InriaSans',
                                color: HexColor("#FFFFFF"),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onPressed: Regresar,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(40.0),
                            ),
                          ),
                        ))),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text('Supervisión del uniforme',
                      style: TextStyle(
                          fontFamily: "InriaSans",
                          fontWeight: FontWeight.w700,
                          fontSize: 32,
                          color: HexColor("#FFFFFF"))),
                ),
                SizedBox(
                  height: 130,
                ),
                Container(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                        padding: EdgeInsets.only(right: 50.0),
                        child: ButtonTheme(
                          minWidth: 10.0,
                          height: 45.0,
                          child: RaisedButton(
                            textColor: HexColor('#FFFFFF'),
                            color: HexColor("#85868E"),
                            child: Text(
                              "1",
                              style: TextStyle(
                                fontSize: 28,
                                fontFamily: 'InriaSans',
                                color: HexColor("#FFFFFF"),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onPressed: () => Calificar('Camisa'),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(40.0),
                            ),
                          ),
                        ))),
                        SizedBox(
                  height: 130,
                ),
                     Container(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                        padding: EdgeInsets.only(right: 70.0),
                        child: ButtonTheme(
                          minWidth: 10.0,
                          height: 45.0,
                          child: RaisedButton(
                            textColor: HexColor('#FFFFFF'),
                            color: HexColor("#85868E"),
                            child: Text(
                              "2",
                              style: TextStyle(
                                fontSize: 28,
                                fontFamily: 'InriaSans',
                                color: HexColor("#FFFFFF"),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onPressed: () => Calificar('Pantalon'),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(40.0),
                            ),
                          ),
                        ))),
                          SizedBox(
                  height: 48,
                ),
                     Container(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: EdgeInsets.only(right: 135.0),
                        child: ButtonTheme(
                          minWidth: 10.0,
                          height: 45.0,
                          child: RaisedButton(
                            textColor: HexColor('#FFFFFF'),
                            color: HexColor("#85868E"),
                            child: Text(
                              "3",
                              style: TextStyle(
                                fontSize: 28,
                                fontFamily: 'InriaSans',
                                color: HexColor("#FFFFFF"),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onPressed: () => Calificar('Zapatos'),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(40.0),
                            ),
                          ),
                        ))),
                         SizedBox(
                  height: 48,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 1.5, color: HexColor("#C4C4C4"))),
                  ),
                  child: Text("Nombre: " + this.NombreUsuario,
                      style: TextStyle(
                          color: HexColor('#85868E'),
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 1.5, color: HexColor("#C4C4C4"))),
                  ),
                  child: Text("Fecha: " + this.now,
                      style: TextStyle(
                          color: HexColor('#85868E'),
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                ),
              ],
            ),
          )),
    )));
  }
}
