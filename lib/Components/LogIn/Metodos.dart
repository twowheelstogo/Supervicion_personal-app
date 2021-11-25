import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:control_empleados/Components/Constants/Index.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class User with ChangeNotifier {
  String Nombre;
  String DPI;
  List BANRURAL_CATALOGOS_AGENCIA;
  List BITACORA_EMPLEADOS;
  List FECHA_INGRESO;
  List No_DOCUMENTO;
  List TMP_MACROREGION;
  List TMP_REGION;
  List NOMBRE_AGENCIA;
  List STATUS_EMPLEADOS;
  List NOMBRES_EMPLEADOS;

  User(
      {required this.Nombre,
      required this.DPI,
      required this.BANRURAL_CATALOGOS_AGENCIA,
      required this.BITACORA_EMPLEADOS,
      required this.FECHA_INGRESO,
      required this.No_DOCUMENTO,
      required this.TMP_MACROREGION,
      required this.TMP_REGION,
      required this.NOMBRE_AGENCIA,
      required this.STATUS_EMPLEADOS,
      required this.NOMBRES_EMPLEADOS});
}

class Autenticacion {
  void storage_(usuario) async {
    // obtain shared preferences
    final prefs = await SharedPreferences.getInstance();
    // set value
    prefs.setString('usuario', usuario);
  }

  // ignore: non_constant_identifier_names
  Future<bool> Autenticar(String NombreUsuario) async {
    List lst = [];
    bool bandera = false;
    //si es correcto entonces pasa a la siguiente vista
    final Response = await getAuthUserInfo(NombreUsuario);
    final Decoded = json.decode(Response.body);

    for (var i in Decoded["records"]) {
      print(i["fields"]);
    }

    if (NombreUsuario == 'ivan arango') {
      storage_(NombreUsuario);
    } else {
      bandera = true;
    }
    return bandera;
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
