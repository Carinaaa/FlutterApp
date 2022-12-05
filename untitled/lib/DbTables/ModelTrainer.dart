
import 'ModelUtilizator.dart';
/*
* Model Trainer clasa ce reprezinta tabela trainer
* mosteneste ModelUtilizator
* */
class ModelTrainer extends ModelUtilizator {

// aici putem sa mai adaugam ce vrem pentru traineri specific

  ModelTrainer(
      {
        required super.id,
        required super.trainer,
        required super.name
      });
}