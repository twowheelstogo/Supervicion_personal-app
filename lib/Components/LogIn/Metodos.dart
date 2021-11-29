import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Supervision_Empleados/Components/Constants/Index.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class Autenticacion {
  void storage_(usuario, id, ID_AIRTABLE) async {
    // obtain shared preferences
    final prefs = await SharedPreferences.getInstance();
    // set value
    prefs.setString('usuario', usuario);
    prefs.setString('DPI', id);
    prefs.setString('IdAIRTABLE', ID_AIRTABLE);
  }

  // ignore: non_constant_identifier_names
  Future<List> Autenticar(String NombreUsuario) async {
    bool bandera = false;
    String Mensaje = "";
    //si es correcto entonces pasa a la siguiente vista
    final Response = await getAuthUserInfo(NombreUsuario);
    final Decoded = json.decode(Response.body);

    if (Response.statusCode == 200) {
      if (Decoded["records"].length > 0) {
        var id = Decoded["records"][0]["fields"]["DPI"];
        var Nombre = Decoded["records"][0]["fields"]["Nombre"];
        var ID_AIRTABLE = Decoded["records"][0]["id"];
        storage_(Nombre.toString(), id.toString(), ID_AIRTABLE.toString());
      } else {
        bandera = true;
        Mensaje = "Credenciales incorrectas.";
      }
    } else {
      bandera = true;
      Mensaje = "Ha ocurrido un error, intente nuevamente.";
    }

    return [bandera, Mensaje];
  }

  Future<http.Response> getAuthUserInfo(String NombreUsuario) async {
    String url = urlApi +
        "ENCARGADO_REGION?filterByFormula=AND({DPI}='" +
        NombreUsuario +
        "')";
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $Token"
    };
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    return response;
  }
}
