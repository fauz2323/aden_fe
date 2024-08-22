// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'order_model.g.dart';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

@JsonSerializable()
class OrderModel {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "order")
  final Order order;

  OrderModel({
    required this.message,
    required this.order,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}

@JsonSerializable()
class Order {
  @JsonKey(name: "user_id")
  final int userId;
  @JsonKey(name: "total_price")
  final int totalPrice;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "id")
  final int id;

  Order({
    required this.userId,
    required this.totalPrice,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
