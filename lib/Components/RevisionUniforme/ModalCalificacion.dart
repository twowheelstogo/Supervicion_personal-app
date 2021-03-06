import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Supervision_Empleados/Components/MainPage/Index.dart';
import 'package:Supervision_Empleados/Components/RevisionUniforme/Metodos.dart';
import 'package:Supervision_Empleados/Components/Componentes/slider.dart';

class UserData extends StatefulWidget {
  final String Tipo;
  final String Numero;
  final double Left;
  final double Right;
  final double Top;
  final double Bottom;
  final String Color;

  final String COLABORADORES;
  final String Encargado;
  final String Latitud;
  final String Longitud;

  const UserData(
      this.Tipo,
      this.Numero,
      this.Left,
      this.Right,
      this.Top,
      this.Bottom,
      this.Color,
      this.COLABORADORES,
      this.Encargado,
      this.Latitud,
      this.Longitud);

  @override
  ModalCalificacion createState() => ModalCalificacion();
}

double val = 0;

class ModalCalificacion extends State<UserData> {
  bool _value = false;
  double val = 1;

  @override
  Widget build(BuildContext context) {
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

    return (Column(children: [
      Padding(
        padding: EdgeInsets.only(
            left: widget.Left,
            right: widget.Right,
            top: widget.Top,
            bottom: widget.Bottom),
        child: ButtonTheme(
          minWidth: 10.0,
          height: 45.0,
          child: FlatButton(
            //textColor: HexColor('#FFFFFF'),
            //color: HexColor("#85868E"),
            child: Text(
              widget.Numero.toString(),
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Lato',
                color: HexColor(widget.Color),
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w400,
              ),
            ),
            onPressed: () => _showModalBottomSheet(context),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(40.0),
            ),
          ),
        ),
      )
    ]));
  }
}
