import 'package:Supervision_Empleados/Components/sql_lite_bd/datos.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'datos.db'),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE datos (Fecha TEXT, ID_AIRTABLE TEXT,ID_USUARIO TEXT,Tipo TEXT)");
    }, version: 1);
  }

  static Future<int> insert(Esquema datos) async {
    Database database = await _openDB();
    return database.insert("datos", datos.toMap());
  }

  static Future<int> delete(Esquema datos) async {
    Database database = await _openDB();
    return database
        .delete("datos", where: "Fecha = ?", whereArgs: [datos.Fecha]);
  }

  static Future<int> update(Esquema datos) async {
    Database database = await _openDB();
    return database.update("datos", datos.toMap(),
        where: "Fecha = ? AND ID_USUARIO = ? AND Tipo = ?",
        whereArgs: [datos.Fecha, datos.ID_USUARIO, datos.Tipo]);
  }

  static Future<List<Esquema>> datos(Esquema datos) async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> datosMap = await database.query("datos",
        where: "Tipo=? AND Fecha=? AND ID_USUARIO = ?",
        whereArgs: [datos.Tipo, datos.Fecha, datos.ID_USUARIO]);
    return List.generate(
        datosMap.length,
        (index) => Esquema(
              Fecha: datosMap[index]['Fecha'],
              ID_AIRTABLE: datosMap[index]['ID_AIRTABLE'],
              ID_USUARIO: datosMap[index]['ID_USUARIO'],
              Tipo: datosMap[index]['Tipo'],
            ));
  }

  static Future<void> insertar2(Esquema datos) async {
    Database database = await _openDB();
    var res = await database.rawInsert(
        "INSERT INTO datos(Fecha,ID_AIRTABLE,ID_USUARIO,Tipo) VALUES(?,?,?,?);",
        [datos.Fecha, datos.ID_AIRTABLE, datos.ID_USUARIO, datos.Tipo]);
  }

   static Future<int> deleteSinWhere() async {
    Database database = await _openDB();
    return database.delete("datos");
  }
  
}
