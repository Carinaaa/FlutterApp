
import 'package:flutter/material.dart';

class AllExercises extends StatelessWidget {
  final List<String> exercises;

  AllExercises(this.exercises);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: exercises
          .map((element) =>
          Card(
            child: Column(
              children: <Widget>[
                Image.asset('assets/my_picture.jpg'),
                Text(element)
              ],
            ),
          )).toList(),
    );
  }
}
