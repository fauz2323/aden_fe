class OrderEntitites {
  final int total;
  final int id;
  final String status;
  final DateTime date;
  final String message;

  OrderEntitites(
      {required this.total,
      required this.id,
      required this.status,
      required this.date,
      required this.message});
}
