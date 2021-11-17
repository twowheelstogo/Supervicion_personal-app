import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Autenticacion {
  void storage_(usuario, pass) async {
    // obtain shared preferences
    final prefs = await SharedPreferences.getInstance();
    // set value
    prefs.setString('usuario', usuario);
    prefs.setString('pass', pass);
  }

  // ignore: non_constant_identifier_names
  bool Autenticar(String usuario, String pass) {
    bool bandera = false;
    //si es correcto entonces pasa a la siguiente vista
    if (usuario == 'ivan arango' && pass == '1234') {
      storage_(usuario, pass);            
    }
    else
    {
      bandera = true;
    }
    return bandera;
  }
}
