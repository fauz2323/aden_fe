import '../../data/model/order_list_model.dart';

class GetAllOrderEntities {
  final String status;
  final List<OrderList> orderList;
  final num price;
  final DateTime date;

  GetAllOrderEntities({
    required this.status,
    required this.orderList,
    required this.price,
    required this.date,
  });
}
