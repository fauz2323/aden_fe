// To parse this JSON data, do
//
//     final orderListModel = orderListModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'order_list_model.g.dart';

OrderListModel orderListModelFromJson(String str) =>
    OrderListModel.fromJson(json.decode(str));

String orderListModelToJson(OrderListModel data) => json.encode(data.toJson());

@JsonSerializable()
class OrderListModel {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "orders")
  final List<Order> orders;

  OrderListModel({
    required this.message,
    required this.orders,
  });

  factory OrderListModel.fromJson(Map<String, dynamic> json) =>
      _$OrderListModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderListModelToJson(this);
}

@JsonSerializable()
class Order {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "user_id")
  final int userId;
  @JsonKey(name: "total_price")
  final int totalPrice;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @JsonKey(name: "order_list")
  final List<OrderList> orderList;

  Order({
    required this.id,
    required this.userId,
    required this.totalPrice,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.orderList,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable()
class OrderList {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "user_order_id")
  final int userOrderId;
  @JsonKey(name: "food_id")
  final int foodId;
  @JsonKey(name: "quantity")
  final int quantity;
  @JsonKey(name: "price")
  final int price;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @JsonKey(name: "food")
  final Food food;

  OrderList({
    required this.id,
    required this.userOrderId,
    required this.foodId,
    required this.quantity,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.food,
  });

  factory OrderList.fromJson(Map<String, dynamic> json) =>
      _$OrderListFromJson(json);

  Map<String, dynamic> toJson() => _$OrderListToJson(this);
}

@JsonSerializable()
class Food {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "category_id")
  final int categoryId;
  @JsonKey(name: "uuid")
  final String uuid;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "price")
  final int price;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "stock")
  final String stock;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;

  Food({
    required this.id,
    required this.categoryId,
    required this.uuid,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.status,
    required this.stock,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);

  Map<String, dynamic> toJson() => _$FoodToJson(this);
}
