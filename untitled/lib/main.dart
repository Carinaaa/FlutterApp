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

  Future<void> insertDog(ModelUtilizator trainer) async {
    // Get a reference to the database.

    final db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'dogs',
      trainer.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  var carina = const ModelUtilizator(id: 0, trainer: true, name: 'Carina');
  await insertDog(carina);

  runApp(const MyApp());
}


