// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/DbTables/ModelUtilizator.dart';

import 'DbTables/ModelTrainer.dart';
import 'View/MyApp.dart';
import 'database/SingletoneDB.dart';

void main() async {
  // Avoid errors caused by flutter upgrade.
// Importing 'package:flutter/widgets.dart' is required.
WidgetsFlutterBinding.ensureInitialized();
// Open the database and store the reference.
  final database = openDatabase(

    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.

    join(await getDatabasesPath(), 'training_sesh.db'),
    onCreate: (db, version) {
// Run the CREATE TABLE statement on the database.

      return db.execute(
        'CREATE TABLE utilizator(id INTEGER PRIMARY KEY, trainer BIT,  name TEXT)',
      );
    },
    version: 1,
  );

  Future<void> insertUtilizator(ModelUtilizator trainer) async {
    // Get a reference to the database.

    final db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'utilizator',
      trainer.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  var carina = const ModelUtilizator(id: 0, trainer: 1, name: 'Carina');
  await insertUtilizator(carina);

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

  // Now, use the method above to retrieve all the dogs.
  print(await utilizatori()); // Prints a list that include Fido.

  runApp(const MyApp());
}


