import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Supervision_Empleados/Components/MainPage/Index.dart';
import 'package:Supervision_Empleados/Components/RevisionUniforme/Metodos.dart';
import 'package:Supervision_Empleados/Components/Componentes/Spiner.dart';

class ModalComentario extends StatefulWidget {
  final String COLABORADORES;
  final String Encargado;
  final String Latitud;
  final String Longitud;
  final String TIPO;

  const ModalComentario(this.COLABORADORES, this.Encargado, this.Latitud,
      this.Longitud, this.TIPO);

  @override
  ModalComentario_ createState() => ModalComentario_();
}

class ModalComentario_ extends State<ModalComentario> {
  final _Comentario_ = TextEditingController();

  void CalificarComentarios() async {
    showDialog(context: context, builder: (_)=>Spinner(),barrierDismissible: false);
    List Res = await Comentarios().Comentario(
        _Comentario_.text.toString(),
        widget.COLABORADORES,
        widget.Encargado,
        widget.Latitud,
        widget.Longitud,
        'UNIFORME',
        widget.TIPO);
    final _snackbar = SnackBar(content: Text(Res[1]));
    Navigator.of(context).pop(true);

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
    void _showModalBottomSheet(BuildContext context) {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ListTile(
                    title: Align(
                      alignment: Alignment.center,
                      child: new Text('Agregar Comentarios',
                          style: TextStyle(
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          )),
                    ),
                    subtitle: Column(
                      children: [
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _Comentario_,
                          minLines: 2,
                          maxLines: 10,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText: 'Comentarios',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                        ),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(right: 0.0, top: 30),
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
                            onPressed: CalificarComentarios,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(40.0),
                            ),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 30),
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
          });
    }

    return (Column(
      children: [
        Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: EdgeInsets.only(right: 0.0),
                child: ButtonTheme(
                  minWidth: 100.0,
                  height: 50.0,
                  child: RaisedButton(
                    textColor: HexColor('#FFFFFF'),
                    color: HexColor("#535461"),
                    child: Text(
                      "Añadir Comentarios",
                      style: TextStyle(
                        fontSize: 20,
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
                )))
      ],
    ));
  }
}