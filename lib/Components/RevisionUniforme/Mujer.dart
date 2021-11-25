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

  const RevisionUniformeMujer(this.NombreUsuario, this.Agencia, this.UrlFoto,
      this.Genero, this.now, this.Tiempo,
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
              "2",
              "Maquillaje",
              0,
              MediaQuery.of(context).size.width * 0.15,
              0,
              0,
              Alignment.bottomCenter),
          ContenedorImages(
              'assets/images/CuerpoMujer/CamisaMujer.png',
              double.infinity,
              MediaQuery.of(context).size.width * 0.35,
              context,
              "3",
              "Camisa",
              0,
              MediaQuery.of(context).size.width * 0.17,
              MediaQuery.of(context).size.width * 0.1,
              0,
              Alignment.bottomRight),
          ContenedorImages(
              'assets/images/CuerpoMujer/PantalonMujer.png',
              double.infinity,
              MediaQuery.of(context).size.width * 0.5,
              context,
              "4",
              "Pantalon",
              MediaQuery.of(context).size.width * 0.25,
              0,
              MediaQuery.of(context).size.width * 0.2,
              0,
              Alignment.bottomLeft),
          ContenedorImages(
              'assets/images/CuerpoMujer/ZapatosMujer.png',
              double.infinity,
              MediaQuery.of(context).size.width * 0.15,
              context,
              "5",
              "Zapatos",
              MediaQuery.of(context).size.width * 0.6,
              0,
              0,
              0,
              Alignment.bottomLeft),
          Final('assets/images/CuerpoMujer/FinalMujer.png', double.infinity,
              MediaQuery.of(context).size.width * 0.40)
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
              UserData('Pelo', '1', MediaQuery.of(context).size.width * 0.4, 0,
                  MediaQuery.of(context).size.width * 0.05, 0),
            ])),
      ]),
    );
  }

  Widget Final(String ruta, double Width, double Height) {
    return SingleChildScrollView(
        child: Container(
      width: Width,
      height: Height,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(ruta), fit: BoxFit.cover)),
      child: Column(
        children: [
          Nombre_Usuario(),
          Fecha(),
          SizedBox(
            height: 20,
          ),
          ModalComentario()
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
      Alignment Tipo) {
    return SingleChildScrollView(
        child: Container(
      width: Width,
      height: Height,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(ruta), fit: BoxFit.cover)),
      child: Container(
        alignment: Tipo,
        child: UserData(Label, Numero, Left, Right, Top, Bottom),
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
