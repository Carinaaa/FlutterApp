import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FullDatabase {
  static final FullDatabase _database = FullDatabase._internal();

  factory FullDatabase() {
    return _database;
  }

  FullDatabase._internal() {
    createDatabase();
  }

  Future<Database> createDatabase() async {
   var db = openDatabase(
      join(await getDatabasesPath(), 'training_sesh.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE utilizator(id INTEGER PRIMARY KEY, trainer BIT,  name TEXT)',
        );
      },
      version: 1,
    );
   return db;
  }
}