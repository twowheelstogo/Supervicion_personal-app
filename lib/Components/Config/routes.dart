import 'package:Supervision_Empleados/Components/LogIn/Index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Supervision_Empleados/Components/MainPage/Index.dart';

const LogIn = '/auth';
const MainRoute = '/main';

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    // final Map<String,dynamic> args = settings.arguments;
    print(settings);
    switch (settings.name) {
      case LogIn:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case MainRoute:
        return MaterialPageRoute(builder: (_) => MainPage());
      default:
        return null;
    }
  }
}
