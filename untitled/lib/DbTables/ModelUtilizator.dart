/*
* Model Utilizator clasa ce reprezinta tabela utilizator
* va fi mostenita de ModelTrainer si ModelClient
* tutorial: https://docs.flutter.dev/cookbook/persistence/sqlite
* */

class ModelUtilizator {
  final int id;
  final int trainer; // true = trainer, false = client
  final String name;

  const ModelUtilizator({
    required this.id,
    required this.trainer,
    required this.name,
  });

  // Convert a Utilizator into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'trainer': trainer,
      'name': name,
    };
  }

  // Implement toString to make it easier to see information about
  // each utilizator when using the print statement.
  @override
  String toString() {
    return 'Utilizator{id: $id, trainer: $trainer, name: $name}';
  }
}