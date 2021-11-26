import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:control_empleados/Components/Constants/Index.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

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
  void storage_(usuario, id) async {
    // obtain shared preferences
    final prefs = await SharedPreferences.getInstance();
    // set value
    prefs.setString('usuario', usuario);
    prefs.setString('id', id);
    String now = DateFormat("yyyy-MM-dd").format(DateTime.now());
    prefs.setString('UltimaHora', now.toString());
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
        storage_(Nombre.toString(), id.toString());
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
