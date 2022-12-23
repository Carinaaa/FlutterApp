
class ClientsAndExercises {
  final int id;
  final int id_client;
  final int id_exercises;
  final int series; // number of series
  final int repetitions; // nr of repetitions on this exercises
  final double max_rep; // kgs used

  const ClientsAndExercises({
    required this.id,
    required this.id_client,
    required this.id_exercises,
    required this.series,
    required this.repetitions,
    required this.max_rep,
  });

Map<String, dynamic> toMap() {
  return {
    'id': id,
    'id_client': id_client,
    'id_exercises': id_exercises,
    'series': series,
    'repetitions': repetitions,
    'max_rep': max_rep,
  };
}

@override
String toString() {
  return 'ClientsAndExercises{  '
      'id: $id, '
      'id_client: $id_client, '
      'id_exercises: $id_exercises,  '
      'series: $series,  '
      'repetitions: $repetitions, '
      'max_rep: $max_rep}';
}
}