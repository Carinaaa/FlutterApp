import 'package:sqflite/sqflite.dart';

import '../DbTables/ClientsAndExercises.dart';

class AccessClientsAndExercises{
  Future<Database> database;

  AccessClientsAndExercises(this.database);

  Future<void> insertExercisesAndClient(ClientsAndExercises clientsAndExercises) async {
    // Get a reference to the database.
    final db = await database;
    await db.insert(
      'ClientsAndExercises',
      clientsAndExercises.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ClientsAndExercises>> allExercisesTriedFromSomeone() async {
    // Get a reference to the database.
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('ClientsAndExercises');

    return List.generate(maps.length, (i) {
      return ClientsAndExercises(
        id: maps[i]['id'],
        id_client: maps[i]['id_client'],
        id_exercises: maps[i]['id_exercises'],
        series: maps[i]['series'],
        repetitions: maps[i]['repetitions'],
        max_rep: maps[i]['max_rep'],
      );
    });
  }

  Future<void> updateClientsAndExercises(ClientsAndExercises clientsAndExercises) async {
    final db = await database;

    await db.update(
      'ClientsAndExercises',
      clientsAndExercises.toMap(),
      where: 'id = ?',
      whereArgs: [clientsAndExercises.id],
    );
  }

//TODO: update this with something better
  Future<void> updateExercisesDone(ClientsAndExercises clientsAndExercises) async {
    final db = await database;
    await db.update(
      'ClientsAndExercises',
      clientsAndExercises.toMap(),
      where: 'id = ?',
      whereArgs: [clientsAndExercises.id],
    );
  }

  Future<void> deleteExercisesDone(ClientsAndExercises clientsAndExercises) async {
    final db = await database;

    await db.update(
      'ClientsAndExercises',
      clientsAndExercises.toMap(),
      where: 'id = ?',
      whereArgs: [clientsAndExercises.id],
    );
  }

  Future<void> addExercisesDone(ClientsAndExercises clientsAndExercises) async {
    final db = await database;

    await db.update(
      'ClientsAndExercises',
      clientsAndExercises.toMap(),
      where: 'id = ?',
      whereArgs: [clientsAndExercises.id],
    );
  }
}