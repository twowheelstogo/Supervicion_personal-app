import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:Supervision_Empleados/Components/Constants/Index.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

class AreaTrabajo {
  Future<String> Validar(
      String TIPO_EVALUACION,
      String COLABORADORES,
      String Encargado,
      String Latitud,
      String Longitud,
      double CALIFICACION) async {
    String bandera = '';

    return bandera;
  }

  Future<List> RevisionArea_(
      String TIPO_EVALUACION,
      String COLABORADORES,
      String Encargado,
      String Latitud,
      String Longitud,
      double CALIFICACION) async {
    List lst = [];

    String tmp = await Validar(TIPO_EVALUACION, COLABORADORES, Encargado,
        Latitud, Longitud, CALIFICACION);

    try {
      final Res = await RevisionAreaTrabajo(TIPO_EVALUACION, COLABORADORES,
          Encargado, Latitud, Longitud, CALIFICACION);

      if (Res.statusCode == 200) {
        return [true, 'Comentario publicado exitosamente.'];
      } else {
        return [false, 'Ha ocurrido un error, intente nuevamente.'];
      }
    } catch (e) {
      return [false, 'Ha ocurrido un error, intente nuevamente.'];
    }
  }

  Future<http.Response> RevisionAreaTrabajo(
      String TIPO_EVALUACION,
      String COLABORADORES,
      String Encargado,
      String Latitud,
      String Longitud,
      double CALIFICACION) async {
    String now = DateFormat("yyyy-MM-dd").format(DateTime.now());
    final position = await Location.instance.getLocation();

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $Token"
    };

    Map<String, dynamic> body = {
      "TIPO_EVALUACION": TIPO_EVALUACION.toUpperCase(),
      "FECHA_REVISION": now,
      "ENCARGADO": [Encargado],
      "COLABORADORES": [COLABORADORES],
      "LATITUD": position.latitude,
      "LONGITUD": position.longitude,
      "CALIFICACION": CALIFICACION
    };

    final bodyEncoded = json.encode({
      "records": [
        {"fields": body}
      ]
    });

    String url = urlApi + 'BITACORA_EMPLEADOS_CALIFICACION';

    print(url);
    print(bodyEncoded);
    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: bodyEncoded);

      return response;
    } on http.ClientException catch (e) {
      throw (e.message);
    }
  }

  Future<http.Response> ValidarCalificacion(String ID) async {
    String url = urlApi + "BITACORA_EMPLEADOS_CALIFICACION/" + ID;
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $Token"
    };
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    return response;
  }

  Future<http.Response> ActualizarCalificacion(
      String TIPO_EVALUACION,
      String COLABORADORES,
      String Encargado,
      String Latitud,
      String Longitud,
      double CALIFICACION,
      ID) async {
    String url = urlApi + "BITACORA_EMPLEADOS_CALIFICACION";
    String now = DateFormat("yyyy-MM-dd").format(DateTime.now());

    final position = await Location.instance.getLocation();

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $Token"
    };

    Map<String, dynamic> body = {
      "TIPO_EVALUACION": TIPO_EVALUACION.toUpperCase(),
      "FECHA_REVISION": now,
      "ENCARGADO": [Encargado],
      "COLABORADORES": [COLABORADORES],
      "LATITUD": position.latitude,
      "LONGITUD": position.longitude,
      "CALIFICACION": CALIFICACION
    };

    final bodyEncoded = json.encode({
      "records": [
        {"id": ID, "fields": body}
      ]
    });

    http.Response response =
        await http.patch(Uri.parse(url), headers: headers, body: bodyEncoded);
    return response;
  }
}
