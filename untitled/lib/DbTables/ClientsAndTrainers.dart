
class ClientsAndTrainers {
  final int id;
  final int id_client;
  final int id_trainer;
  final double price;
  final String start_date;
  final String end_date;

  const ClientsAndTrainers({
    required this.id,
    required this.id_client,
    required this.id_trainer,
    required this.price,
    required this.start_date,
    required this.end_date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_client': id_client,
      'id_trainer': id_trainer,
      'price': price,
      'start_date': start_date,
      'end_date': end_date,
    };
  }

  @override
  String toString() {
    return 'ClientsAndTrainers{'
        'id: $id, '
        'id_client: $id_client, '
        'id_trainer: $id_trainer, '
        'price: $price, '
        'start_date: $start_date,'
        'end_date: $end_date}';
  }
}