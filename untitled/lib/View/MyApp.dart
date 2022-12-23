import 'package:flutter/material.dart';
import 'package:untitled/View/ExercisesManager.dart';

import '../main.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('EasyList'),
        ),
        body: ExercisesManager('Product tester'),
      ),
    );
  }
}
