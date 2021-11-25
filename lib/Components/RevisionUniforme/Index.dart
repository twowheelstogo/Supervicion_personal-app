import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:control_empleados/Components/MainPage/Index.dart';
import 'package:control_empleados/Components/RevisionUniforme/Metodos.dart';
import 'package:control_empleados/Components/RevisionUniforme/ModalComentario.dart';
import 'package:control_empleados/Components/RevisionUniforme/ModalCalificacion.dart';

class RevisionUniforme extends StatelessWidget {
  final String NombreUsuario;
  final String Agencia;
  final String UrlFoto;
  final String Genero;
  final String now;

  const RevisionUniforme(
      this.NombreUsuario, this.Agencia, this.UrlFoto, this.Genero, this.now,
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

  void Regresar(context) {
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => MainPage(),
        ),
      );
    }

  @override
  Widget build(BuildContext context) {
    
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
                  height: MediaQuery.of(context).size.width * 0.15,
                ),
                Regresar_(context),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Titulo(),
                //this.Left,this.Right,this.Top,this.Bottom
                Container(
                  alignment: Alignment.bottomRight,
                  child: UserData('Camisa', '1', 0, 50,
                      MediaQuery.of(context).size.width * 0.40, 0),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.30,
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: UserData('Pantalon', '2', 0, 50,
                      MediaQuery.of(context).size.width * 0.40, 0),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.16,
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: UserData('Zapatos', '3', 0, 50,
                      MediaQuery.of(context).size.width * 0.40, 0),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.20,
                ),
                Nombre_Usuario(),
                Fecha(),
                SizedBox(
                  height: 10,
                ),
                ModalComentario(),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )),
    )));
  }

  Widget Regresar_(context) {
    return Column(
      children: [
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
                                fontFamily: 'Lato',
                                color: HexColor("#FFFFFF"),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onPressed: () => Regresar(context),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(40.0),
                            ),
                          ),
                        ))),
      ],
    );
  }

  Widget Titulo() {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text('Supervisión del uniforme',
              style: TextStyle(
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                  color: HexColor("#FFFFFF"))),
        ),
      ],
    );
  }

  Widget Fecha() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1.5, color: HexColor("#C4C4C4"))),
          ),
          child: Text("Fecha: " + this.now,
              style: TextStyle(
                  color: HexColor('#85868E'),
                  fontSize: 20,
                  fontWeight: FontWeight.w700)),
        ),
      ],
    );
  }

  Widget Nombre_Usuario() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1.5, color: HexColor("#C4C4C4"))),
          ),
          child: Text("Nombre: " + this.NombreUsuario,
              style: TextStyle(
                  color: HexColor('#85868E'),
                  fontSize: 20,
                  fontWeight: FontWeight.w700)),
        ),
      ],
    );
  }
}
