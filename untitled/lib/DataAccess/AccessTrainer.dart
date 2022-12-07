// Define a function that inserts dogs into the database
import 'package:sqflite/sqflite.dart';

import '../DbTables/ModelTrainer.dart';
import '../DbTables/ModelUtilizator.dart';

// probably add the insert here

class AccessTrainer{
  late Future<Database> database;

  AccessTrainer(Future<Database> database){
    this.database = database;
  }

  Future<void> insertUtilizator(ModelUtilizator trainer) async {
    // Get a reference to the database.
    final db = await database;
    await db.insert(
      'utilizator',
      trainer.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<ModelUtilizator>> utilizatori() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('utilizator');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return ModelUtilizator(
        id: maps[i]['id'],
        trainer: maps[i]['trainer'],
        name: maps[i]['name'],
      );
    });
  }

  Future<void> updateUtilizatori(ModelUtilizator utilizator) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'utilizator',
      utilizator.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [utilizator.id],
    );
  }
}