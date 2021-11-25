import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:control_empleados/Components/RevisionUniforme/Metodos.dart';

class MySliderApp extends StatefulWidget {
  double Numero;
  String Tipo;
  MySliderApp(this.Numero,this.Tipo, {Key? key}) : super(key: key);
  @override
  _MySliderAppState createState() => _MySliderAppState();
}

class _MySliderAppState extends State<MySliderApp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: widget.Numero.toDouble(),
          min: 1.0,
          max: 10.0,
          divisions: 10,
          activeColor: HexColor("#1F4497"),
          inactiveColor: HexColor("#85868E"),
          label: 'Califique ' + widget.Tipo,
          onChanged: (double newValue) {
            setState(() {
              widget.Numero = newValue.round().toDouble();
            });
          },
        ),
        Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Text('Calificación: ' + widget.Numero.toString())
            ),
            Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(right: 0.0, bottom: 30),
                        child: ButtonTheme(
                          minWidth: 100.0,
                          height: 45.0,
                          child: RaisedButton(
                            textColor: HexColor('#FFFFFF'),
                            color: HexColor("#B3B4BC"),
                            child: Text(
                              "Aceptar",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Lato',
                                color: HexColor("#FFFFFF"),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onPressed: () => Comentarios()
                                .Calificacion(widget.Tipo, widget.Numero),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(40.0),
                            ),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 20.0, bottom: 30),
                        child: ButtonTheme(
                          minWidth: 100.0,
                          height: 45.0,
                          child: RaisedButton(
                            textColor: HexColor('#FFFFFF'),
                            color: HexColor("#B3B4BC"),
                            child: Text(
                              "Cancelar",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Lato',
                                color: HexColor("#FFFFFF"),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onPressed: () => Navigator.pop(context),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(40.0),
                            ),
                          ),
                        )),
                  ],
                )
      ],
    );
  }
}
