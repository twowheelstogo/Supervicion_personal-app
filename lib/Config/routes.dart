import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:control_empleados/Components/LogIn/Index.dart';
import 'package:control_empleados/Components/MainPage/Index.dart';

const Login = '/Inicio';
const Main = '/Main';

class Routes{
  static Route<dynamic>? generateRoute(RouteSettings settings){
    // final Map<String,dynamic> args = settings.arguments;
    switch (settings.name) {
      case Login:
        return MaterialPageRoute(builder: (_)=>LoginPage());      
      case Main:
        return MaterialPageRoute(builder: (_)=>MainPage());      
      default:
      return null;      
    }
  }
}