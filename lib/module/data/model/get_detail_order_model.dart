import 'package:json_annotation/json_annotation.dart';

part 'get_detail_order_model.g.dart';

@JsonSerializable()
class GetDetailOrderModel {
  GetDetailOrderModel({
    required this.message,
    required this.order,
  });

  final String message;
  final Order order;

  factory GetDetailOrderModel.fromJson(Map<String, dynamic> json) =>
      _$GetDetailOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetDetailOrderModelToJson(this);

  @override
  String toString() {
    return "$message, $order, ";
  }
}

@JsonSerializable()
class Order {
  Order({
    required this.id,
    required this.userId,
    required this.totalPrice,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.orderList,
  });

  final int id;

  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'total_price')
  final int totalPrice;
  final String status;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @JsonKey(name: 'order_list')
  final List<OrderList> orderList;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);

  @override
  String toString() {
    return "$id, $userId, $totalPrice, $status, $createdAt, $updatedAt, $orderList, ";
  }
}

@JsonSerializable()
class OrderList {
  OrderList({
    required this.id,
    required this.userOrderId,
    required this.foodId,
    required this.quantity,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;

  @JsonKey(name: 'user_order_id')
  final int userOrderId;

  @JsonKey(name: 'food_id')
  final int foodId;
  final int quantity;
  final int price;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  factory OrderList.fromJson(Map<String, dynamic> json) =>
      _$OrderListFromJson(json);

  Map<String, dynamic> toJson() => _$OrderListToJson(this);

  @override
  String toString() {
    return "$id, $userOrderId, $foodId, $quantity, $price, $createdAt, $updatedAt, ";
  }
}
