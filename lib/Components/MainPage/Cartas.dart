import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:getwidget/getwidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:Supervision_Empleados/Components/MainPage/Metodos.dart';
import 'package:Supervision_Empleados/Components/RevisionArea/index.dart';

import 'package:Supervision_Empleados/Components/RevisionUniforme/Hombre.dart';
import 'package:Supervision_Empleados/Components/RevisionUniforme/Mujer.dart';

class Cartas extends StatelessWidget {
  final String NombreUsuario;
  final String Agencia;
  final String UrlFoto;
  final String Genero;
  final String now;
  final String Estado;
  final DateTime Tiempo;
  final String Region;
  final String ID_EMPLEADO;
  final String ID_AIRTABLE;

  const Cartas(
      this.NombreUsuario,
      this.Agencia,
      this.UrlFoto,
      this.Genero,
      this.now,
      this.Estado,
      this.Tiempo,
      this.Region,
      this.ID_EMPLEADO,
      this.ID_AIRTABLE,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void CalificarUsuario(int Opcion) async {
      await Principal().TruncateTable();
      if (Opcion == 1) {
        if (this.Genero == 'Masculino') {
          Navigator.push<void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => RevisionUniformeHombre(
                  this.NombreUsuario,
                  this.Agencia,
                  this.UrlFoto,
                  this.Genero,
                  this.now,
                  this.Tiempo,
                  this.ID_EMPLEADO,
                  this.ID_AIRTABLE),
            ),
          );
        } else {
          Navigator.push<void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => RevisionUniformeMujer(
                  this.NombreUsuario,
                  this.Agencia,
                  this.UrlFoto,
                  this.Genero,
                  this.now,
                  this.Tiempo,
                  this.ID_EMPLEADO,
                  this.ID_AIRTABLE),
            ),
          );
        }
      } else {
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => RevisionArea(
                this.NombreUsuario,
                this.Agencia,
                this.UrlFoto,
                this.Genero,
                this.now,
                this.Tiempo,
                this.ID_EMPLEADO,
                this.ID_AIRTABLE),
          ),
        );
      }
    }

    return Column(
      children: [
        Card(
          // Con esta propiedad agregamos margen a nuestro Card
          // El margen es la separaci??n entre widgets o entre los bordes del widget padre e hijo
          margin: EdgeInsets.all(1),

          // Con esta propiedad agregamos elevaci??n a nuestro card
          // La sombra que tiene el Card aumentar??
          elevation: 10,

          // La propiedad child anida un widget en su interior
          // Usamos columna para ordenar un ListTile y una fila con botones
          child: Column(
            children: <Widget>[
              // Usamos ListTile para ordenar la informaci??n del card como titulo, subtitulo e icono
              ListTile(
                  contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                  title: Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1.5, color: HexColor("#C4C4C4"))),
                    ),
                    child: Text('Nombre: ' + this.NombreUsuario,
                        style: TextStyle(
                            color: HexColor('#85868E'),
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontWeight: FontWeight.w700)),
                  ),
                  subtitle: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1.5, color: HexColor("#C4C4C4"))),
                        ),
                        child: Text("Agencia: " + this.Agencia,
                            style: TextStyle(
                                color: HexColor('#85868E'),
                                fontSize: MediaQuery.of(context).size.width * 0.05,
                                fontWeight: FontWeight.w700)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1.5, color: HexColor("#C4C4C4"))),
                        ),
                        child: Text("Regi??n: " + this.Region,
                            style: TextStyle(
                                color: HexColor('#85868E'),
                                fontSize: MediaQuery.of(context).size.width * 0.05,
                                fontWeight: FontWeight.w700)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1.5, color: HexColor("#C4C4C4"))),
                        ),
                        child: Text("Estado: " + this.Estado,
                            style: TextStyle(
                                color: HexColor('#85868E'),
                                fontSize: MediaQuery.of(context).size.width * 0.05,
                                fontWeight: FontWeight.w700)),
                      ),
                      // Container(
                      //   margin: const EdgeInsets.only(top: 10),
                      //   width: double.infinity,
                      //   decoration: BoxDecoration(
                      //     border: Border(
                      //         bottom: BorderSide(
                      //             width: 1.5, color: HexColor("#C4C4C4"))),
                      //   ),
                      //   child: Text(
                      //       "Laborando: " +
                      //           TiempoLaborando().ObtenerTiempoLaborando(
                      //               this.Tiempo.toString()),
                      //       style: TextStyle(
                      //           color: HexColor('#85868E'),
                      //           fontSize: 20,
                      //           fontWeight: FontWeight.w700)),
                      // ),
                    ],
                  ),
                  trailing: userIcon(this.UrlFoto)),
              SizedBox(
                height: 20,
              ),
              Row(children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 0.0),
                    child: ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width * 0.02,
                      height: 45.0,
                      child: RaisedButton(
                        textColor: HexColor('#FFFFFF'),
                        color: HexColor("#535461"),
                        child: Text(
                          "Revisar Uniforme",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontFamily: 'Lato',
                            color: HexColor("#FFFFFF"),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onPressed: () => CalificarUsuario(1),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(40.0),
                        ),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 0.0),
                    child: ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width * 0.1,
                      height: 45.0,
                      child: RaisedButton(
                        textColor: HexColor('#FFFFFF'),
                        color: HexColor("#535461"),
                        child: Text(
                          "Revisar Area",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontFamily: 'Lato',
                            color: HexColor("#FFFFFF"),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onPressed: () => CalificarUsuario(2),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(40.0),
                        ),
                      ),
                    )),
              ]),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget userIcon(String photourl) {
    //authModel.user.urlFoto;
    return Padding(
        padding: const EdgeInsets.all(1.0),
        child: GFAvatar(
            backgroundImage: NetworkImage(photourl),
            shape: GFAvatarShape.standard));
  }
}
