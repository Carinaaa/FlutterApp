// Define a function that inserts dogs into the database
import 'package:sqflite/sqflite.dart';

import '../DbTables/ModelTrainer.dart';

class AccessTrainer{
  Future<Database> database;

  AccessTrainer(this.database);

  Future<void> insertTrainer(ModelTrainer trainer) async {
    // Get a reference to the database.
    final db = await database;
    await db.insert(
      'trainer',
      trainer.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ModelTrainer>> allTrainers() async {
    // Get a reference to the database.
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('trainer');

    return List.generate(maps.length, (i) {
      return ModelTrainer(
        id: maps[i]['id'],
        trainer: maps[i]['trainer'],
        name: maps[i]['name'],
      );
    });
  }

  Future<void> updateTrainers(ModelTrainer trainer) async {
    final db = await database;

    await db.update(
      'trainer',
      trainer.toMap(),
      where: 'id = ?',
      whereArgs: [trainer.id],
    );
  }
}