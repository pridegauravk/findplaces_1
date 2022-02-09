import 'dart:io';
import 'package:sigmatenant/models/sigma_places.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/sigma_places.dart';
import '../models/sigma_places.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the Employee table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'places.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE places('
          'spaceList TEXT,'
          'id INTEGER PRIMARY KEY,'
          'email TEXT,'
          'firstName TEXT,'
          'lastName TEXT,'
          'avatar TEXT'
          ')');
    });
  }

  createplaces(Places newplaces) async {
    await deleteAllplaces();
    final db = await database;
    final res = await db!.insert('Employee', newplaces.toJson());

    return res;
  }

  Future<int> deleteAllplaces() async {
    final db = await database;
    final res = await db!.rawDelete('DELETE FROM places');

    return res;
  }

  Future<List> getallplaces() async {
    final db = await database;
    final res = await db!.rawQuery("SELECT * FROM places");

    List list =
        res.isNotEmpty ? res.map((c) => Places.fromJson(c)).toList() : [];

    return list;
  }
}
