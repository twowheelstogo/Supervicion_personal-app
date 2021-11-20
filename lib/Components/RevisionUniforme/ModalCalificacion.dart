import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:control_empleados/Components/MainPage/Index.dart';
import 'package:control_empleados/Components/RevisionUniforme/Metodos.dart';

class UserData extends StatefulWidget {
  final String Tipo;
  final String Numero;
  const UserData(this.Tipo,this.Numero);

  @override
  ModalCalificacion createState() => ModalCalificacion();
}

class ModalCalificacion extends State<UserData> {
  @override
  Widget build(BuildContext context) {
    double _currentSliderValue = 0;

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
                            fontFamily: "InriaSans",
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          )),
                    ),
                    subtitle: Column(
                      children: [
                        SizedBox(height: 20),
                        Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(child:
                        Slider(
                           value: _currentSliderValue,
                            min: 0,
                            max: 100,
                            divisions: 10,
                            label: _currentSliderValue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderValue = value;
                            });
                          },
                        )
                        ))
                      ],
                    )),
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
                                fontFamily: 'InriaSans',
                                color: HexColor("#FFFFFF"),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onPressed: () => Comentarios()
                                .Calificacion(widget.Tipo, _currentSliderValue),
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
                                fontFamily: 'InriaSans',
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
          });
    }

    return (Column(children: [
      Container(
          alignment: Alignment.bottomRight,
          child: Padding(
              padding: EdgeInsets.only(right: 50.0),
              child: ButtonTheme(
                minWidth: 10.0,
                height: 45.0,
                child: RaisedButton(
                  textColor: HexColor('#FFFFFF'),
                  color: HexColor("#85868E"),
                  child: Text(
                    "1",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'InriaSans',
                      color: HexColor("#FFFFFF"),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () => _showModalBottomSheet(context),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(40.0),
                  ),
                ),
              ))),
    ]));
  }
}
