import 'package:sqflite/sqflite.dart';

import '../DbTables/ModelClient.dart';

class AccessClients{
  Future<Database> database;

  AccessClients(this.database);

  Future<void> insertClient(ModelClient client) async {
    // Get a reference to the database.
    final db = await database;
    await db.insert(
      'client',
      client.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ModelClient>> allClients() async {
    // Get a reference to the database.
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('client');

    return List.generate(maps.length, (i) {
      return ModelClient(
        id: maps[i]['id'],
        trainer: maps[i]['trainer'],
        name: maps[i]['name'],
        weight: maps[i]['weight'],
        height: maps[i]['height'],
        age: maps[i]['age'],
        sex: maps[i]['sex'],
        photo: maps[i]['photo'],
        scope: maps[i]['scope'],
      );
    });
  }

  Future<void> updateClients(ModelClient client) async {
    final db = await database;

    await db.update(
      'client',
      client.toMap(),
      where: 'id = ?',
      whereArgs: [client.id],
    );
  }
}