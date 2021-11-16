import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:getwidget/getwidget.dart';

class Cartas extends StatefulWidget {
  const Cartas({Key? key}) : super(key: key);
  @override
  Cartas_ createState() {
    return new Cartas_();
  }
}

class Cartas_ extends State<Cartas> {
   final Nombre = TextEditingController();
    final Agencia = TextEditingController();
  
 @override
  void dispose() {
    Nombre.dispose();
    Agencia.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
       Card(        
    // Con esta propiedad agregamos margen a nuestro Card
    // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
    margin: EdgeInsets.all(1),
    
    // Con esta propiedad agregamos elevación a nuestro card
    // La sombra que tiene el Card aumentará
    elevation: 10,

    // La propiedad child anida un widget en su interior
    // Usamos columna para ordenar un ListTile y una fila con botones
    child: Column(
      children: <Widget>[

        // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Container(
          margin: const EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.5, color: HexColor("#C4C4C4"))
            ),
          ),child: Text("Nombre: Iván Arango",style: TextStyle(color: HexColor('#85868E'),
          fontSize: 20, fontWeight: FontWeight.w700
          )),
          )          ,     
          subtitle:  
          Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.5, color: HexColor("#C4C4C4"))
            ),
          ),child: Text("Agencia: Miraflores",style: TextStyle(color: HexColor('#85868E'),
          fontSize: 20, fontWeight: FontWeight.w700
          )),
          ) 
          ,trailing: GFAvatar(
          backgroundImage:NetworkImage('https://th.bing.com/th/id/R.3f68b1c1df0eca4c3f19aaaff7c451d9?rik=iCVR8%2b2viEBH4A&pid=ImgRaw&r=0'            
          ),shape: GFAvatarShape.standard,          
          maxRadius: 35,
          
          )
          ),    
          SizedBox(
            height: 20,
          ),            
           Row(
            children: <Widget>[
            Padding(
            padding: EdgeInsets.only(left: 10.0, right: 0.0),            
            child: ButtonTheme(
              minWidth: 196.0,
              height: 45.0,
              child: RaisedButton(              
              textColor: HexColor('#FFFFFF'),                            
              color: HexColor("#535461"),
              child: Text(
                  "Revisar Uniforme",
                  style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'InriaSans',
                  color: HexColor("#FFFFFF"),
                  fontWeight: FontWeight.w400,
                ),
              ),
              onPressed: () {},
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(40.0),
              ),
            ),

            )
          )
            ]
        ),
         SizedBox(
            height: 20,
          ),  
      ],
    ),
  )
     ],
    );
  }
}
