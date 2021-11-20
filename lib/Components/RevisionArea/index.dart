import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:control_empleados/Components/MainPage/Index.dart';

class RevisionArea extends StatelessWidget {
  final String NombreUsuario;
  final String Agencia;  
  final String now;

  const RevisionArea(
      this.NombreUsuario, this.Agencia, this.now,
      {Key? key})
      : super(key: key);

  @override
  
  Widget build(BuildContext context) {
    
    void Regresar() {
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => MainPage(),
        ),
      );
    }
    return Scaffold(body: Center(
      child: Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage('assets/images/R.jpg'), fit: BoxFit.cover)),
      child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
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
                                fontFamily: 'InriaSans',
                                color: HexColor("#FFFFFF"),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onPressed: Regresar,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(40.0),
                            ),
                          ),
                        ))),
                                  ],
            ),
          )),
    )));    
  }
}
