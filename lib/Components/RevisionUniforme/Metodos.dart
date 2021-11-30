import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:Supervision_Empleados/Components/Constants/Index.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:Supervision_Empleados/Components/sql_lite_bd/datos.dart';
import 'package:Supervision_Empleados/Components/sql_lite_bd/dba.dart';

class Comentarios {
  Future<List> ValidarCalificacion(String ID_USUARIO, String Tipo) async {
    List retornar = [];
    String now = DateFormat("yyyy-MM-dd").format(DateTime.now());

    List<Esquema> lst = await DB.datos(Esquema(
        Fecha: now,
        ID_AIRTABLE: '',
        ID_USUARIO: ID_USUARIO,
        Tipo: Tipo.toUpperCase()));
    if (lst.length > 0) {
      retornar = ['1', lst[0].ID_AIRTABLE];
    } else {
      retornar = ['0', ''];
    }
    print(retornar);
    return retornar;
  }

  Future<List> Calificacion(
      String TIPO_EVALUACION,
      String COLABORADORES,
      String Encargado,
      String Latitud,
      String Longitud,
      double CALIFICACION) async {
    List lst = await ValidarCalificacion(COLABORADORES, TIPO_EVALUACION);
    String now = DateFormat("yyyy-MM-dd").format(DateTime.now());

    if (lst[0] == '0') {
      try {
        final Res = await CalificarTrabajo(TIPO_EVALUACION, COLABORADORES,
            Encargado, Latitud, Longitud, CALIFICACION);

        if (Res.statusCode == 200) {
          await DB.insertar2(Esquema(
              Fecha: now,
              ID_AIRTABLE: Encargado,
              ID_USUARIO: COLABORADORES,
              Tipo: TIPO_EVALUACION));
          return [true, 'Califación realizada exitosamente.'];
        } else {
          print('aqui 1.0 error 1');
          return [false, 'Ha ocurrido un error, intente nuevamente.'];
        }
      } catch (e) {
        print('aqui 1.0 error 2');
        return [false, 'Ha ocurrido un error, intente nuevamente.'];
      }
    } else {
      try {
        final Res = await CalificarTrabajoPatch(TIPO_EVALUACION, COLABORADORES,
            Encargado, Latitud, Longitud, CALIFICACION, lst[1]);

        if (Res.statusCode == 200) {
          await DB.update(Esquema(
              Fecha: now,
              ID_AIRTABLE: Encargado,
              ID_USUARIO: COLABORADORES,
              Tipo: TIPO_EVALUACION));
          return [true, 'Califación realizada exitosamente.'];
        } else {
          print('aqui 1.1 error 1');
          return [false, 'Ha ocurrido un error, intente nuevamente.'];
        }
      } catch (e) {
        print('aqui 1.1 error 2');
        return [false, 'Ha ocurrido un error, intente nuevamente.'];
      }
    }
  }

  Future<http.Response> CalificarTrabajo(
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

  Future<http.Response> CalificarTrabajoPatch(
      String TIPO_EVALUACION,
      String COLABORADORES,
      String Encargado,
      String Latitud,
      String Longitud,
      double CALIFICACION,
      String ID) async {
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

    String url = urlApi + 'BITACORA_EMPLEADOS_CALIFICACION/$ID';

    print(url);
    print(bodyEncoded);
    try {
      final response =
          await http.patch(Uri.parse(url), headers: headers, body: bodyEncoded);

      return response;
    } on http.ClientException catch (e) {
      throw (e.message);
    }
  }

  Future<http.Response> ComentarTrabajo(
      String COMENTARIO,
      String COLABORADORES,
      String Encargado,
      String Latitud,
      String Longitud,
      String TIPO,
      String TIPO2) async {
    String now = DateFormat("yyyy-MM-dd").format(DateTime.now());
    // LocationResult result = await Geolocation.lastKnownLocation();
    // double lat = result.location.latitude;
    // double lng = result.location.longitude;
    final position = await Location.instance.getLocation();

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $Token"
    };

    Map<String, dynamic> body = {
      "COMENTARIO": COMENTARIO,
      "FECHA_COMENTARIO": now,
      "ENCARGADO": [Encargado],
      "COLABORADORES": [COLABORADORES],
      "LATITUD": position.latitude,
      "LONGITUD": position.longitude,
      "AREA": TIPO.toUpperCase(),
      "TIPO": TIPO2.toUpperCase()
    };

    final bodyEncoded = json.encode({
      "records": [
        {"fields": body}
      ]
    });

    String url = urlApi + 'BITACORA_EMPLEADOS_COMENTARIOS';

    print(url);
    print(bodyEncoded);
    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: bodyEncoded);
      print(response.statusCode);
      return response;
    } on http.ClientException catch (e) {
      throw (e.message);
    }
  }

  Future<List> Comentario(
      String COMENTARIO,
      String COLABORADORES,
      String Encargado,
      String Latitud,
      String Longitud,
      String TIPO,
      String TIPO2) async {
    List lst = [];
    try {
      final Res = await ComentarTrabajo(
          COMENTARIO, COLABORADORES, Encargado, Latitud, Longitud, TIPO, TIPO2);

      if (Res.statusCode == 200) {
        return [true, 'Comentario publicado exitosamente.'];
      } else {
        return [false, 'Ha ocurrido un error, intente nuevamente.'];
      }
    } catch (e) {
      return [false, 'Ha ocurrido un error, intente nuevamente.'];
    }
  }
}
