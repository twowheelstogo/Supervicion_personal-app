import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Supervision_Empleados/Components/MainPage/Index.dart';
import 'package:Supervision_Empleados/Components/RevisionArea/Metodos.dart';
import 'package:Supervision_Empleados/Components/RevisionArea/ModalCalificacion.dart';
import 'package:Supervision_Empleados/Components/RevisionArea/ModalComentario.dart';

class RevisionArea extends StatelessWidget {
  final String NombreUsuario;
  final String Agencia;
  final String UrlFoto;
  final String Genero;
  final String now;
  final DateTime Tiempo;
  final String ID_EMPLEADO;
  final String ID_AIRTABLE;

  RevisionArea(this.NombreUsuario, this.Agencia, this.UrlFoto, this.Genero,
      this.now, this.Tiempo, this.ID_EMPLEADO, this.ID_AIRTABLE,
      {Key? key})
      : super(key: key);

  void Regresar(context) {
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => MainPage(),
      ),
    );
  }

  void CalificarAreaTrabajo(String Tipo) async {
    // List res = await AreaTrabajo()
    //     .RevisionArea_(Tipo, ID_EMPLEADO, ID_AIRTABLE, '0', '0', 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        color: HexColor('#1F4497'),
      ),
      child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                Regresar_(context),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Titulo(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                AreasTrabajo(
                    'assets/images/AreaTrabajo/piso.png', 'Pisos', context),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                AreasTrabajo(
                    'assets/images/AreaTrabajo/baños.png', 'Baños', context),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                AreasTrabajo('assets/images/AreaTrabajo/ventanas.png',
                    'Ventanas', context),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                AreasTrabajo('assets/images/AreaTrabajo/muebles.png',
                    'Inmuebles', context),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                )
              ],
            ),
          )),
    )));
  }

  Widget Titulo() {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text('Revisión área de trabajo',
              style: TextStyle(
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                  color: HexColor("#FFFFFF"))),
        ),
      ],
    );
  }

  Widget AreasTrabajo(String url, String Tipo, context) {
    return Column(
      children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.90,
            height: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(url),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              child: Inicio(Tipo, context),
            ))
      ],
    );
  }

  Widget Inicio(String Tipo, context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 10,
          left: 15,
          child: Container(
            width: 150.0,
            height: 100.0,
            child: Text(Tipo,
                style: TextStyle(
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: HexColor("#85868E"))),
          ),
        ),
        Positioned(
          top: 10,
          right: 5,
          child: Container(
            width: 120.0,
            height: 100.0,
            child: UserData(Tipo, this.ID_EMPLEADO, this.ID_AIRTABLE, '0', '0'),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.width * 0.46,
          right: 5,
          child: Container(
            width: 120.0,
            height: 100.0,
            child: ModalComentario(
                this.ID_EMPLEADO, this.ID_AIRTABLE, '0', '0', Tipo),
          ),
        ),
      ],
    );
  }

  Widget Final(String Tipo, context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 10,
          left: 15,
          child: Container(
            width: 150.0,
            height: 100.0,
            child: Text(Tipo,
                style: TextStyle(
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: HexColor("#85868E"))),
          ),
        ),
        Positioned(
          top: 10,
          right: 5,
          child: Container(
            width: 120.0,
            height: 100.0,
            child: UserData(Tipo, this.ID_EMPLEADO, this.ID_AIRTABLE, '0', '0'),
          ),
        ),
      ],
    );
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
                    textColor: HexColor('#535461'),
                    color: HexColor("#FFFFFF"),
                    child: Text(
                      "Regresar",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Lato',
                        color: HexColor("#535461"),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () => Regresar(context),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(40.0),
                    ),
                  ),
                )))
      ],
    );
  }
}
