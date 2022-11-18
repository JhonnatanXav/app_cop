import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RegisterDatabase{
  static final RegisterDatabase instance=RegisterDatabase._int();
  static Database? _database;

  RegisterDatabase._int();

   

  Future<Database> get database async{
    if(_database != null) return _database!;

    _database=await _initDB('register.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath,filePath);

    return await openDatabase(path,onCreate: _onCreateDB);
  }

  Future _onCreateDB(Database db, int version) async{
    await db.execute('''
    CREATE TABLE cart_items(
    id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT,
    password TEXT
    )
    ''');
  }

 
}