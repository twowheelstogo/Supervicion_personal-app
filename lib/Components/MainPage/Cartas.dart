import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:getwidget/getwidget.dart';

class Cartas extends StatelessWidget {
  final String NombreUsuario;
  final String Agencia;
  final String UrlFoto;
  final String Genero;

  const Cartas(this.NombreUsuario, this.Agencia,this.UrlFoto,this.Genero,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          // Con esta propiedad agregamos margen a nuestro Card
          // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
          margin: EdgeInsets.all(1),

          // Con esta propiedad agregamos elevación a nuestro card
          // La sombra que tiene el Card aumentará
          elevation: 10,

          // La propiedad child anida un widget en su interior
          // Usamos columna para ordenar un ListTile y una fila con botones
          child: Column(
            children: <Widget>[
              // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                title: Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 1.5, color: HexColor("#C4C4C4"))),
                  ),
                  child: Text('Nombre: ' + this.NombreUsuario,
                      style: TextStyle(
                          color: HexColor('#85868E'),
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                ),
                subtitle: Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 1.5, color: HexColor("#C4C4C4"))),
                  ),
                  child: Text("Agencia: " + this.Agencia,
                      style: TextStyle(
                          color: HexColor('#85868E'),
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                ),
                // trailing: Image.network(
                //   this.UrlFoto,
                //   height: 90,
                // ),
                trailing: 
                GFAvatar(
                  backgroundImage:NetworkImage(this.UrlFoto),
                  shape: GFAvatarShape.standard
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 13.0, right: 0.0),
                    child: ButtonTheme(
                      minWidth: 196.0,
                      height: 45.0,
                      child: RaisedButton(
                        textColor: HexColor('#FFFFFF'),
                        color: HexColor("#535461"),
                        child: Text(
                          "Revisar Uniforme",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'InriaSans',
                            color: HexColor("#FFFFFF"),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onPressed: () {},
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(40.0),
                        ),
                      ),
                    ))
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
}
