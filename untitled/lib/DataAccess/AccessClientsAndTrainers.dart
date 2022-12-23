import 'package:sqflite/sqflite.dart';

import '../DbTables/ClientsAndTrainers.dart';

import '../DbTables/Exercises.dart';

class AccessClientsAndTrainers{
  Future<Database> database;

  AccessClientsAndTrainers(this.database);

  Future<void> insertClientsAndTrainers(ClientsAndTrainers clientsAndTrainers) async {
    // Get a reference to the database.
    final db = await database;
    await db.insert(
      'ClientsAndTrainers',
      clientsAndTrainers.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ClientsAndTrainers>> allContractsBetweenClientsAndTrainers() async {
    // Get a reference to the database.
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('ClientsAndTrainers');

    return List.generate(maps.length, (i) {
      return ClientsAndTrainers(
        id: maps[i]['id'],
        id_client: maps[i]['id_client'],
        id_trainer: maps[i]['id_trainer'],
        price: maps[i]['price'],
        start_date: maps[i]['start_date'],
        end_date: maps[i]['end_date'],
      );
    });
  }

  Future<void> updateExercises(ClientsAndTrainers clientsAndTrainers) async {
    final db = await database;

    await db.update(
      'ClientsAndTrainers',
      clientsAndTrainers.toMap(),
      where: 'id = ?',
      whereArgs: [clientsAndTrainers.id],
    );
  }
}