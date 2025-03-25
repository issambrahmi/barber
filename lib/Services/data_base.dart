import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';

class AppDataBase {
  static Database? _db;

  Future<Database?> get db async {
    _db ??= await initDb();
    return _db;
  }

  initDb() async {
    String path = await getDatabasesPath();
    String fullPath = '$path/barber.db';

    Database db = await openDatabase(fullPath, version: 3, onCreate: _onCreate);
    await db.execute('PRAGMA foreign_keys = ON;');
    return db;
  }

  _onCreate(Database db, int version) async {
    try {
      await db.execute('''
    CREATE TABLE 'Clients' (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL , 
      phone_number TEXT  
    );
''');
      await db.execute('''
     CREATE TABLE 'Reservations' (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      client_name TEXT NOT NULL,
      phone_number TEXT ,
      comment TEXT ,
      date TEXT NOT NULL ,
      state Text DEFAULT 'Waiting',
      client_id INTEGER , 
      FOREIGN KEY(client_id) REFERENCES Clients(id)
    );
''');
      debugPrint('db created');
    } catch (e) {
      debugPrint('===============$e');
    }
  }

  Future<bool> insert(String sql) async {
    try {
      Database? myDb = await db;
      await myDb!.rawInsert(sql);
      return true;
    } catch (e) {
      debugPrint('=====$e');
      return false;
    }
  }

  Future<List<Map<String, Object?>>> read(String sql) async {
    try {
      Database? myDb = await db;
      return await myDb!.rawQuery(sql);
    } catch (e) {
      debugPrint('=============$e');
      return [];
    }
  }

  Future<bool> edit(String sql) async {
    try {
      Database? myDb = await db;
      await myDb!.rawUpdate(sql);
      return true;
    } catch (e) {
      debugPrint('=========$e');
      return false;
    }
  }

  Future<bool> delete(String sql) async {
    try {
      Database? myDb = await db;
      await myDb!.rawDelete(sql);
      return true;
    } catch (e) {
      debugPrint('=========$e');
      return false;
    }
  }
}
