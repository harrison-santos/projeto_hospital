import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

abstract class DB{
  static Database _db;
  static int get __version => 1;

  static Future<void> init() async{
      if(_db != null ){ return; }

      try {
        String _path = await getDatabasesPath()+"projeto_hospital";
        _db = await openDatabase(_path, version: __version, onCreate: onCreate);
      }
      catch(exception){
          print(exception);
      }
  }

  static void onCreate(Database db, int version) async =>
      await db.execute("CREATE TABLE medicos (id INTEGER PRIMARY KEY NOT NULL, nome String, crm String, telefone String, atendimento int)");
}