import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:control_empleados/Components/MainPage/Index.dart';
import 'package:control_empleados/Components/RevisionUniforme/Metodos.dart';
import 'package:control_empleados/Components/Componentes/slider.dart';

class UserData extends StatefulWidget {
  final String Tipo;
  final String Numero;
  final double Left;
  final double Right;
  final double Top;
  final double Bottom;
  const UserData(this.Tipo, this.Numero,this.Left,this.Right,this.Top,this.Bottom);

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
                            child:
                                Center(child: MySliderApp(val, widget.Tipo))),
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
              padding: EdgeInsets.only(left: widget.Left,right: widget.Right,top: widget.Top,bottom: widget.Bottom ),
              child: 
              ButtonTheme(
                minWidth: 10.0,
                height: 45.0,
                child: RaisedButton(
                  textColor: HexColor('#FFFFFF'),
                  color: HexColor("#85868E"),
                  child: Text(
                    widget.Numero.toString(),
                    style: TextStyle(
                      fontSize: 28,
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
              ),)
                    
    ]));
  }
}
