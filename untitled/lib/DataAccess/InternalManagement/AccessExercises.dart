import 'package:sqflite/sqflite.dart';

import '../../DbTables/Exercises.dart';

class AccessExercises{
  Future<Database> database;

  AccessExercises(this.database);

  Future<void> insertExercises(Exercises exercises) async {
    // Get a reference to the database.
    final db = await database;
    await db.insert(
      'exercises',
      exercises.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Exercises>> allExercises() async {
    // Get a reference to the database.
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('exercises');

    return List.generate(maps.length, (i) {
      return Exercises(
        id: maps[i]['id'],
        category: maps[i]['category'],
        name: maps[i]['name'],
        photo: maps[i]['photo'],
      );
    });
  }

  Future<void> updateExercises(Exercises exercises) async {
    final db = await database;

    await db.update(
      'exercises',
      exercises.toMap(),
      where: 'id = ?',
      whereArgs: [exercises.id],
    );
  }
}