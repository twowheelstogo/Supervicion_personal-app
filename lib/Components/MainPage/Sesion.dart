import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Supervision_Empleados/Components/LogIn/Index.dart';
import 'package:Supervision_Empleados/Components/sql_lite_bd/dba_comentarios.dart';
import 'package:Supervision_Empleados/Components/sql_lite_bd/dba.dart';

class LogOut extends StatefulWidget {
  @override
  LogOut_ createState() => LogOut_();
}

class LogOut_ extends State<LogOut> {
  void _onSelected(String opt) async {
    switch (opt) {
      case 'SIGNOUT':
        signOut();
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => LoginPage(),
          ),
        );
        break;
      default:
        break;
    }
  }

  void signOut() async {
    SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    prefs.remove("usuario");
    prefs.remove("IdAIRTABLE");
    prefs.remove("DPI");
    prefs.remove("FechaActual");
     DBComentario.deleteSinWhere();
     DB.deleteSinWhere();
  }



  String NombreUsuario = "";

  Future<String> getName() async {
    final prefs = await SharedPreferences.getInstance();
    String Nombre = '';
    final res = prefs.getString('usuario');
    Nombre = '$res ';
    return Nombre;
  }

  LogOut_() {
    getName().then((val) => setState(() {
          NombreUsuario = val;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
        onSelected: _onSelected,
        itemBuilder: (BuildContext context) {
          return [
            // PopupMenuItem<String>(
            //     child: ListTile(
            //       dense: true,
            //       title: Text(
            //         NombreUsuario,
            //         style: Theme.of(context).textTheme.bodyText2,
            //       ),
            //     ),
            //     value: 'PROFILE'),
            PopupMenuItem<String>(
                child: ListTile(
                  dense: true,
                  leading: Icon(Icons.exit_to_app),
                  title: Text(
                    'Cerrar Sesi??n',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                value: 'SIGNOUT'),
          ];
        });
  }
}
