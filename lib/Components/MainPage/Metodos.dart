import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:Supervision_Empleados/Components/Constants/Index.dart';
import 'dart:convert';
import 'package:location/location.dart';


class Empleado with ChangeNotifier {
  final String Nombre;
  final String Agencia;
  final String urlFoto;
  final String Genero;
  final String Estado;
  final DateTime Tiempo;
  final String Region;
  final String ID_EMPLEADO;

  Empleado(
      {required this.Nombre,
      required this.Agencia,
      required this.urlFoto,
      required this.Genero,
      required this.Estado,
      required this.Tiempo,
      required this.Region,
      required this.ID_EMPLEADO});
}

class Principal {
  List<Empleado> AsignarValores(final Lista) {
    List<Empleado> tmp = [];
    for (var i in Lista) {
      tmp.add(Empleado(
          Nombre: i.Nombre,
          Agencia: i.Agencia,
          urlFoto: i.urlFoto,
          Genero: i.Genero,
          Estado: i.Estado,
          Tiempo: i.Tiempo,
          Region: i.Region,
          ID_EMPLEADO: i.ID_EMPLEADO));
    }
    return tmp;
  }

  List<Empleado> ListaFiltrada(
      final Lista_, String usuario, String region, String agencia) {
    print('agencia: ' + agencia);
    List<Empleado> lista = AsignarValores(Lista_);
    List<Empleado> newLst = lista
        .where((o) => o.Nombre.toLowerCase().contains(usuario.toLowerCase()))
        .toList();
    List<Empleado> newLst2 = newLst
        .where((o) => o.Region.toLowerCase().contains(region.toLowerCase()))
        .toList();
    List<Empleado> newLst3 = newLst2
        .where((o) => o.Agencia.toLowerCase().contains(agencia.toLowerCase()))
        .toList();
    return newLst3;
  }

  Future<List<Empleado>> DataEmpleados(String id) async {
    List<Empleado> lista = [];
    final Response = await getEmpleadosInfo(id);
    final Decoded = json.decode(Response.body);

    if (Response.statusCode == 200) {
      if (Decoded["records"].length > 0 && id.length > 0) {
        final TotalEmpleados =
            Decoded["records"][0]["fields"]["TOTAL_EMPLEADOS_ASIGNADOS"];
        final NOMBRES_EMPLEADOS =
            Decoded["records"][0]["fields"]["NOMBRES_EMPLEADOS"];
        int Contador = 0;
        int Contador2 = 0;
        int Contador3 = 0;

        for (var i in TotalEmpleados) {
          for (var j in NOMBRES_EMPLEADOS) {
            if (Contador == i) {
              Contador = 0;
              break;
            } else {
              DateTime parseDt = DateTime.parse(
                  Decoded["records"][0]["fields"]["FECHA_INGRESO"][Contador3]);

              var tmp = Decoded["records"][0]["fields"]["STATUS_EMPLEADOS"]
                      [Contador2]
                  .split(',');

              lista.add(Empleado(
                  Nombre: Convertir(Decoded["records"][0]["fields"]
                          ["NOMBRES_EMPLEADOS"][Contador3]
                      .toString()),
                  Agencia: Convertir(Decoded["records"][0]["fields"]
                          ["NOMBRE-AGENCIA"][Contador2]
                      .toString()),
                  urlFoto: Decoded["records"][0]["fields"]["FOTO_PERFIL"]
                      [Contador3]["url"],
                  Genero: Decoded["records"][0]["fields"]["GENERO"][Contador3],
                  Estado: Convertir(tmp[Contador].replaceAll(' ', '')),
                  Tiempo:
                      DateTime.utc(parseDt.year, parseDt.month, parseDt.day),
                  Region:
                      Convertir(Decoded["records"][0]["fields"]["TMP_REGION"][Contador2].toString()),
                  ID_EMPLEADO: Decoded["records"][0]["fields"]["EMPLEADOS"][Contador3]));
              Contador = Contador + 1;
            }
            Contador3 = Contador3 + 1;
          }
          Contador2 = Contador2 + 1;
        }
      }
    }
    return lista;
  }

  Future<http.Response> getEmpleadosInfo(String NombreUsuario) async {
    String url = urlApi +
        "ENCARGADO_REGION?filterByFormula=AND({DPI}='" +
        NombreUsuario +
        "')";
    print(url);
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $Token"
    };
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    return response;
  }

  void storage_(llave, valor) async {
    // obtain shared preferences
    final prefs = await SharedPreferences.getInstance();
    // set value
    prefs.setString(llave, valor);
  }

  String Convertir(String entrada) {
    String tmp = entrada.replaceAll('  ', ' ');
    //print(tmp);
    var tmp2 = tmp.split(' ');
    String tmp3 = "";
    for (var i in tmp2) {
      tmp3 = tmp3 +
          i[0].toUpperCase() +
          i.substring(1, i.length).toLowerCase() +
          " ";
    }
    return tmp3.substring(0, tmp3.length - 1);
  }
}

class TiempoLaborando {
  String ObtenerTiempoLaborando(String Tiempo) {
    String NuevaFecha = "";

    if (Tiempo != '') {
      var birthDate = DateTime.tryParse(Tiempo);
      if (birthDate != null) {
        final now = new DateTime.now();

        int years = now.year - birthDate.year;
        int months = now.month - birthDate.month;
        int days = now.day - birthDate.day;

        if (months < 0 || (months == 0 && days < 0)) {
          years--;
          months += (days < 0 ? 11 : 12);
        }

        if (days < 0) {
          final monthAgo = new DateTime(now.year, now.month - 1, birthDate.day);
          days = now.difference(monthAgo).inDays + 1;
        }

        if (years > 0) {
          return NuevaFecha = '$years años - $months meses - $days dias';
        } else if (years == 0 && months > 0 && days > 0) {
          return NuevaFecha = '$months meses - $days dias';
        } else if (years == 0 && months == 0 && days > 0) {
          return NuevaFecha = '$days dias';
        } else {
          return NuevaFecha = '$months meses - $days dias';
        }
      } else {
        return NuevaFecha;
      }
    } else {
      return NuevaFecha;
    }
  }
  
}
