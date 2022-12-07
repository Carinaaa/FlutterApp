// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/DataAccess/AccessTrainer.dart';
import 'package:untitled/DbTables/ModelUtilizator.dart';
import 'View/MyApp.dart';
import 'database/FullDatabase.dart';

void main() async {
  // Avoid errors caused by flutter upgrade.
// Importing 'package:flutter/widgets.dart' is required.
WidgetsFlutterBinding.ensureInitialized();
// Open the database and store the reference.
  final database = FullDatabase().createDatabase();

  AccessTrainer accessTrainer = AccessTrainer(database);

  var carina = const ModelUtilizator(id: 0, trainer: 1, name: 'Carina');
  await accessTrainer.insertUtilizator(carina);

  // Now, use the method above to retrieve all the dogs.
  print(await accessTrainer.utilizatori()); // Prints a list that include Fido.

  // Update Fido's age and save it to the database.
  carina = ModelUtilizator(
    id: carina.id,
    name: carina.name,
    trainer: carina.trainer - 1,
  );
  await accessTrainer.updateUtilizatori(carina);

// Print the updated results.
  print(await accessTrainer.utilizatori()); // Prints Carina with trainer 0 -> client.

  runApp(const MyApp());
}


