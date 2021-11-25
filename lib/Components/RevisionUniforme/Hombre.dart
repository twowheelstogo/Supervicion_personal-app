import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:control_empleados/Components/MainPage/Metodos.dart';
import 'package:control_empleados/Components/MainPage/Index.dart';

class RevisionUniformeHombre extends StatelessWidget {
  final String NombreUsuario;
  final String Agencia;
  final String UrlFoto;
  final String Genero;
  final String now;
  final DateTime Tiempo;

  const RevisionUniformeHombre(this.NombreUsuario, this.Agencia, this.UrlFoto,
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
        body: Column(
      children: [

        //Titulo Y Regresar
        Container(
          width: double.infinity,
          height: 400,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
                    "assets/images/CuerpoHombre/CabezaHombre.png"
                    ),
            fit: BoxFit.cover
        )
          ),          
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
              ]))    
        )     
      ],
    ));
  }

  Widget ContenedorImages(String ruta, double Width, double Height) {
    return Container(
      width: Width,
      height: Height,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(ruta), fit: BoxFit.cover)),
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
          child: Text("Laborando: " + TiempoLaborando().ObtenerTiempoLaborando(this.Tiempo.toString()),
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
