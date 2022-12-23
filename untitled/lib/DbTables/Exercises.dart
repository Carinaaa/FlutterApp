
class Exercises {
  final int id;
  final int category; // 0 lower body, 1 upper body, 2 resistance etc
  final String name;
  final String photo;

  const Exercises({
    required this.id,
    required this.category,
    required this.name,
    required this.photo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_exercises': id,
      'category': category,
      'name': name,
      'photo': photo,
    };
  }

  @override
  String toString() {
    return 'Exercises{id: $id, category: $category, , name: $name, , photo: $photo}';
  }
}