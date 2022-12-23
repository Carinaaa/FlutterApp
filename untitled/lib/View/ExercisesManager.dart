import 'package:flutter/material.dart';
import 'package:untitled/View/AllExercises.dart';

class ExercisesManager extends StatefulWidget {

  final String startingProduct;

  ExercisesManager(this.startingProduct) {
    print('[Products widget] Constructor');
  }

  @override
  State<StatefulWidget> createState() {
    return _ExercisesManagerState(); // in tutorial this is product
  }
}

class _ExercisesManagerState extends State<ExercisesManager>{
  List<String> _exercises = ['some exercise'];

  @override
  void initState(){
    _exercises.add(widget.startingProduct);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
      Container (
      margin: const EdgeInsets.all(10.0),
      child: ElevatedButton (
        onPressed: () {
          setState(() {
            _exercises.add('Advanced something else');
          });
        },
        child: const Text('Add product'),
      ),
      ),
        AllExercises(_exercises)
      ],);
  }

}