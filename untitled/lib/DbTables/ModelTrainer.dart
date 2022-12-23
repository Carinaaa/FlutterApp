
import 'ModelUtilizator.dart';

class ModelTrainer extends ModelUtilizator {

  ModelTrainer(
      {
        required super.id,
        required super.trainer,
        required super.name,
      });

Map<String, dynamic> toMap() {
  return {
    'id': id,
    'trainer': trainer,
    'name': name,
  };
}

@override
String toString() {
  return 'Trainer {id: $id, trainer: $trainer, name: $name}';
}
}