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
                    height: MediaQuery.of(context).size.width * 0.3,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Column(                            
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [       

                              
                             ],
                          ))
                        ],
                      ),
                    )),                        
      ]
    );
  }
}
