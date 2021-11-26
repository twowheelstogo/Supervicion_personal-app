import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:control_empleados/Components/MainPage/Metodos.dart';
import 'package:control_empleados/Components/MainPage/Index.dart';
import 'package:control_empleados/Components/RevisionUniforme/ModalComentario.dart';
import 'package:control_empleados/Components/RevisionUniforme/ModalCalificacion.dart';

class RevisionUniformeHombre extends StatelessWidget {
  final String NombreUsuario;
  final String Agencia;
  final String UrlFoto;
  final String Genero;
  final String now;
  final DateTime Tiempo;
  final String ID_EMPLEADO;
  final String ID_AIRTABLE;

  const RevisionUniformeHombre(this.NombreUsuario, this.Agencia, this.UrlFoto,
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
                'assets/images/CuerpoHombre/CamisaHombre.png',
                double.infinity,
                MediaQuery.of(context).size.width * 0.45,
                context,
                "Camisa",
                "Camisa",
                0,
                MediaQuery.of(context).size.width * 0.06,
                MediaQuery.of(context).size.width * 0.1,
                0,
                Alignment.bottomRight),
            ContenedorImages(
                'assets/images/CuerpoHombre/PantalonHombre.png',
                double.infinity,
                MediaQuery.of(context).size.width * 0.45,
                context,
                "Pantalon",
                "Pantalon",
                MediaQuery.of(context).size.width * 0.1,
                0,
                MediaQuery.of(context).size.width * 0.1,
                0,
                Alignment.bottomLeft),
            ContenedorImages(
                'assets/images/CuerpoHombre/ZapatosHombre.png',
                double.infinity,
                MediaQuery.of(context).size.width * 0.16,
                context,
                "Zapatos",
                "Zapatos",
                0,
                MediaQuery.of(context).size.width * 0.1,
                0,
                0,
                Alignment.bottomRight),
            Final('assets/images/CuerpoHombre/FinalHombre.png', double.infinity,
                MediaQuery.of(context).size.width * 0.40, context)
          ],
        ),
      )),
    );
  }

  Widget Inicio(context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width * 0.9,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/CuerpoHombre/CabezaHombre.png"),
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
          ModalComentario(),
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
      Alignment Tipo) {
    return SingleChildScrollView(
        child: Container(
      width: Width,
      height: Height,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(ruta), fit: BoxFit.cover)),
      child: Container(
        alignment: Tipo,
        child: UserData(Label, Numero, Left, Right, Top, Bottom, "#1f4497",
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

  Widget Fecha(context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
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
