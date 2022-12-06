import 'ModelUtilizator.dart';

/*
* Model Client clasa ce reprezinta tabela trainer
* mosteneste ModelUtilizator
* am adaugat varsta, kilograme si inaltime
* */

class ModelClient extends ModelUtilizator {

  int age; // changeable
  double kgs; // changeable
  double cms; // changeable


  ModelClient(
      {
        required super.id,
        required super.trainer,
        required super.name,
        required this.age,
        required this.kgs,
        required this.cms
      });
}