import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:control_empleados/Components/MainPage/Metodos.dart';
import 'package:control_empleados/Components/MainPage/Index.dart';
import 'package:control_empleados/Components/RevisionUniforme/ModalComentario.dart';
import 'package:control_empleados/Components/RevisionUniforme/ModalCalificacion.dart';

class RevisionUniformeMujer extends StatelessWidget {
  final String NombreUsuario;
  final String Agencia;
  final String UrlFoto;
  final String Genero;
  final String now;
  final DateTime Tiempo;
  final String ID_EMPLEADO;
  final String ID_AIRTABLE;

  const RevisionUniformeMujer(this.NombreUsuario, this.Agencia, this.UrlFoto,
      this.Genero, this.now, this.Tiempo, this.ID_EMPLEADO, this.ID_AIRTABLE,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
      child: Column(
        children: [
          Inicio(context),
          ContenedorImages(
              'assets/images/CuerpoMujer/CaraMujer.png',
              double.infinity,
              MediaQuery.of(context).size.width * 0.17,
              context,
              "Maquillaje",
              "Maquillaje",
              MediaQuery.of(context).size.width * 0.15,
              0,
              0,
              5,
              '#ffffff',
              Alignment.bottomLeft),
          ContenedorImages(
              'assets/images/CuerpoMujer/CamisaMujer.png',
              double.infinity,
              MediaQuery.of(context).size.width * 0.35,
              context,
              "Camisa",
              "Camisa",
              0,
              MediaQuery.of(context).size.width * 0.09,
              MediaQuery.of(context).size.width * 0.13,
              0,
              '#535461',
              Alignment.bottomRight),
          ContenedorImages(
              'assets/images/CuerpoMujer/PantalonMujer.png',
              double.infinity,
              MediaQuery.of(context).size.width * 0.5,
              context,
              "Pantalon",
              "Pantalon",
              MediaQuery.of(context).size.width * 0.1,
              0,
              MediaQuery.of(context).size.width * 0.2,
              0,
              '#535461',
              Alignment.bottomLeft),
          ContenedorImages(
              'assets/images/CuerpoMujer/ZapatosMujer.png',
              double.infinity,
              MediaQuery.of(context).size.width * 0.15,
              context,
              "Zapatos",
              "Zapatos",
              MediaQuery.of(context).size.width * 0.6,
              0,
              0,
              0,
              '#535461',
              Alignment.bottomLeft),
          Final('assets/images/CuerpoMujer/FinalMujer.png', double.infinity,
              MediaQuery.of(context).size.width * 0.40, context)
        ],
      ),
    )));
  }

  Widget Inicio(context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width * 0.7,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/CuerpoMujer/PeloMujer.png"),
              fit: BoxFit.cover)),
      child: Column(children: <Widget>[
        //Titulo Y Regresar
        SingleChildScrollView(
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
              UserData(
                  'Cabello',
                  'Cabello',
                  MediaQuery.of(context).size.width * 0.53,
                  0,
                  MediaQuery.of(context).size.width * 0.05,
                  0,
                  '#ffffff',
                  this.ID_EMPLEADO,
                  this.ID_AIRTABLE,
                  '0',
                  '0'),
            ])),
      ]),
    );
  }

  Widget Final(String ruta, double Width, double Height, context) {
    return SingleChildScrollView(
        child: Container(
      width: Width,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(ruta), fit: BoxFit.cover)),
      child: Column(
        children: [
          Nombre_Usuario(context),
          Fecha(context),
          SizedBox(
            height: 20,
          ),
          ModalComentario(this.ID_EMPLEADO, this.ID_AIRTABLE, '0', '0',
              'REVISION UNIFORME'),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    ));
  }

  Widget ContenedorImages(
      String ruta,
      double Width,
      double Height,
      context,
      String Numero,
      String Label,
      double Left,
      double Right,
      double Top,
      double Bottom,
      String Color,
      Alignment Tipo) {
    return SingleChildScrollView(
        child: Container(
      width: Width,
      height: Height,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(ruta), fit: BoxFit.cover)),
      child: Container(
        alignment: Tipo,
        child: UserData(Label, Numero, Left, Right, Top, Bottom, Color,
            this.ID_EMPLEADO, this.ID_AIRTABLE, '0', '0'),
      ),
    ));
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

  Widget Fecha(context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1.5, color: HexColor("#C4C4C4"))),
          ),
          child: Text(
              "Laborando: " +
                  TiempoLaborando()
                      .ObtenerTiempoLaborando(this.Tiempo.toString()),
              style: TextStyle(
                  color: HexColor('#85868E'),
                  fontSize: 20,
                  fontWeight: FontWeight.w700)),
        ),
      ],
    );
  }

  Widget Nombre_Usuario(context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
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
