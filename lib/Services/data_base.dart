import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class AppDataBase {
  static Database? _db;

  Future<Database?> get db async {
    _db ??= await initDb();
    return _db;
  }

  initDb() async {
    String path = await getDatabasesPath();
    String fullPath = '$path/barberr.db}';

    Database db = await openDatabase(fullPath, onCreate: _onCreate, version: 1);
    await db.execute('PRAGMA foreign_keys = ON;');
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE 'Clients' (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL , 
      phoneNumber TEXT  
    );

    CREATE TABLE 'Reservations' (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      client_name TEXT NOT NULL,
      phone_number TEXT ,
      comment TEXT ,
      date TEXT NOT NULL ,
      client_id INTEGER , 
      FOREIGN KEY(client_id) REFERENCES clients(id)
    );
  
''');
    print('db created');
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
    Database? myDb = await db;
    return await myDb!.rawQuery(sql);
  }

  Future<int> edit(String sql) async {
    Database? myDb = await db;
    return await myDb!.rawUpdate(sql);
  }

  Future<int> delete(String sql) async {
    Database? myDb = await db;
    return await myDb!.rawDelete(sql);
  }
}
