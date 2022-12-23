import 'ModelUtilizator.dart';

class ModelClient extends ModelUtilizator {

  final double weight; // kgs
  final int height; // cms
  final int age; // years
  final int sex; // 0 fem 1 male 2 trans-female 3 trans-male 4 not mentioned
  final String photo; // cute photo
  final int scope; // 0 - gain muscle, 1 - lose weight, 2 - gain weight, 3 - increase resistance etc

  ModelClient(
      {
        required super.id, // inherited
        required super.trainer, // inherited
        required super.name, // inherited
        required this.weight, // kgs
        required this.height, // cms
        required this.age, // years
        required this.sex, // 0 fem 1 male 2 trans-female 3 trans-male
        required this.photo, // cute photo
        required this.scope, // foregin key for exercises
      });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'trainer': trainer,
      'name': name,
      'weight': weight,
      'height': height,
      'age': age,
      'sex': sex,
      'photo': photo,
      'id_scope': scope,
    };
  }
  // Implement toString to make it easier to see information about
  @override
  String toString() {
    return 'Client {id: $id, trainer: $trainer, name: $name, weight: $weight, height: $height,'
        'age: $age, sex: $sex, photo: $photo, id_scope: $scope}';
  }
}