import 'dart:ffi';
import 'package:Supervision_Empleados/Components/sql_lite_bd/comentarios.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBComentario {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'comentarios.db'),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE datos (Fecha TEXT, ID_AIRTABLE TEXT,ID_USUARIO TEXT,Tipo TEXT, Comentario TEXT, Area TEXT)");
    }, version: 1);
  }

  static Future<int> insert(Esquema_Comentario datos) async {
    Database database = await _openDB();
    return database.insert("comentarios", datos.toMap());
  }

  static Future<int> delete(Esquema_Comentario datos) async {
    Database database = await _openDB();
    return database
        .delete("comentarios", where: "Fecha = ?", whereArgs: [datos.Fecha]);
  }

  static Future<int> deleteSinWhere() async {
    Database database = await _openDB();
    return database.delete("comentarios");
  }

  static Future<int> update(Esquema_Comentario datos) async {
    Database database = await _openDB();
    return database.update("comentarios", datos.toMap(),
        where: "Fecha = ? AND ID_USUARIO = ? AND Tipo = ?",
        whereArgs: [datos.Fecha, datos.ID_USUARIO, datos.Tipo]);
  }

  static Future<List<Esquema_Comentario>> datos(
      Esquema_Comentario datos) async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> datosMap = await database.query("comentarios",
        where: "Tipo=? AND Fecha=? AND ID_USUARIO = ?",
        whereArgs: [datos.Tipo, datos.Fecha, datos.ID_USUARIO]);
    return List.generate(
        datosMap.length,
        (index) => Esquema_Comentario(
            Fecha: datosMap[index]['Fecha'],
            ID_AIRTABLE: datosMap[index]['ID_AIRTABLE'],
            ID_USUARIO: datosMap[index]['ID_USUARIO'],
            Tipo: datosMap[index]['Tipo'],
            Comentario: datosMap[index]['Comentario'],
            Area: datosMap[index]['Area']));
  }

  static Future<void> insertar2(Esquema_Comentario datos) async {
    Database database = await _openDB();
    var res = await database.rawInsert(
        "INSERT INTO comentarios(Fecha,ID_AIRTABLE,ID_USUARIO,Tipo,Comentario,Area) VALUES(?,?,?,?,?,?);",
        [
          datos.Fecha,
          datos.ID_AIRTABLE,
          datos.ID_USUARIO,
          datos.Tipo,
          datos.Comentario,
          datos.Area
        ]);
  }
}
