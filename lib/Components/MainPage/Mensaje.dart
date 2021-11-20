import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mensaje extends StatefulWidget {
  const Mensaje({Key? key}) : super(key: key);
  @override
  Mensaje_ createState() {
    return new Mensaje_();
  }
}

class Mensaje_ extends State<Mensaje> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: HexColor('#B3B4BC'),                    
                    width: double.infinity,
                    height: MediaQuery.of(context).size.width * 0.22,
                    //padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              child: Column(                            
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [       
                              //ROW
                                Row(                
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 12),
                    color: HexColor('#85868E'),
                    width: 99,
                    height: 60,                    
                    child: Text('Listado',
                    style: TextStyle(color: HexColor('#FFFFFF'),
                    fontSize: 18, fontWeight: FontWeight.w300
                      )
                  )),

                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 5,top: 12),
                    color: HexColor('#85868E'),
                    width: 130,
                    height: 60,                    
                    child: Text('Empleados',
                    style: TextStyle(color: HexColor('#FFFFFF'),
                    fontSize: 18, fontWeight: FontWeight.w300
                      )
                  )),
                                 
                    Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 5,top: 12),
                    color: HexColor('#85868E'),
                    width: 153,
                    height: 60,                    
                    child: Text('Macroregión 1',
                    style: TextStyle(color: HexColor('#FFFFFF'),
                    fontSize: 18, fontWeight: FontWeight.w300
                      )
                  )),
                  
                ],
              ),
                             ],
                          ))
                        ],
                      ),
                    )),                        
      ]
    );
  }
}