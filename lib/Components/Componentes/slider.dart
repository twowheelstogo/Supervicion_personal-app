import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:control_empleados/Components/RevisionUniforme/Metodos.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class MySliderApp extends StatefulWidget {
  String TIPO_EVALUACION;
  String COLABORADORES;
  String Encargado;
  String Latitud;
  String Longitud;
  double CALIFICACION;

  MySliderApp(this.TIPO_EVALUACION, this.COLABORADORES, this.Encargado,
      this.Latitud, this.Longitud, this.CALIFICACION,
      {Key? key})
      : super(key: key);
  @override
  _MySliderAppState createState() => _MySliderAppState();
}

class _MySliderAppState extends State<MySliderApp> {
  bool Loading = false;

  void CalificarUniforme() async {
    setState(() {
      Loading = true;
    });

    List Res = await Comentarios().Calificacion(
        widget.TIPO_EVALUACION,
        widget.COLABORADORES,
        widget.Encargado,
        widget.Latitud,
        widget.Longitud,
        widget.CALIFICACION);

    setState(() {
      Loading = false;
    });

    final _snackbar = SnackBar(content: Text(Res[1]));

    if (Res[0] == true) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(_snackbar);
    } else {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(_snackbar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: widget.CALIFICACION,
          min: 1.0,
          max: 10.0,
          divisions: 10,
          activeColor: HexColor("#1F4497"),
          inactiveColor: HexColor("#85868E"),
          label: 'Califique ' + widget.TIPO_EVALUACION,
          onChanged: (double newValue) {
            setState(() {
              widget.CALIFICACION = newValue.round().toDouble();
            });
          },
        ),
        Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Text('Calificación: ' + widget.CALIFICACION.toString())),
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
                    onPressed: CalificarUniforme,
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
