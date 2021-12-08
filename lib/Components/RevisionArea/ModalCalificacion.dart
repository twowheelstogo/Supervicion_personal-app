import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Supervision_Empleados/Components/MainPage/Index.dart';
import 'package:Supervision_Empleados/Components/RevisionUniforme/Metodos.dart';
import 'package:Supervision_Empleados/Components/Componentes/slider.dart';
import 'package:Supervision_Empleados/Components/Componentes/Spiner.dart';

class UserData extends StatefulWidget {
  final String Tipo;

  final String COLABORADORES;
  final String Encargado;
  final String Latitud;
  final String Longitud;

  const UserData(this.Tipo, this.COLABORADORES, this.Encargado, this.Latitud,
      this.Longitud);

  @override
  ModalCalificacion createState() => ModalCalificacion();
}

double val = 0;

class ModalCalificacion extends State<UserData> {
  bool _value = false;
  double val = 1;

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Align(
                  alignment: Alignment.center,
                  child: new Text(widget.Tipo,
                      style: TextStyle(
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      )),
                ),
              ),
              Column(
                children: [
                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 25.0),
                          child: Center(
                              child: MySliderApp(
                                  widget.Tipo,
                                  widget.COLABORADORES,
                                  widget.Encargado,
                                  widget.Latitud,
                                  widget.Longitud,
                                  val))),
                    ],
                  )
                ],
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return (Column(children: [Revisar_(context)]));
  }

  Widget Revisar_(context) {
    return Column(
      children: [
        ButtonTheme(
          minWidth: 61,
          height: 30,
          child: RaisedButton(
            textColor: HexColor('#FFFFFF'),
            color: HexColor("#F16623"),
            child: Text(
              "Revisar",
              style: TextStyle(
                fontSize: 13,
                fontFamily: 'Lato',
                color: HexColor("#FFFFFF"),
                fontWeight: FontWeight.w400,
              ),
            ),
            onPressed: () => _showModalBottomSheet(context),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(40.0),
            ),
          ),
        ),
      ],
    );
  }
}
