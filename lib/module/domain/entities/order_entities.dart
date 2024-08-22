class OrderEntitites {
  final int total;
  final String status;
  final DateTime date;
  final String message;

  OrderEntitites(
      {required this.total,
      required this.status,
      required this.date,
      required this.message});
}
