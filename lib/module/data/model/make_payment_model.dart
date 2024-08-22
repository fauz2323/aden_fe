// To parse this JSON data, do
//
//     final makePaymentModel = makePaymentModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'make_payment_model.g.dart';

MakePaymentModel makePaymentModelFromJson(String str) =>
    MakePaymentModel.fromJson(json.decode(str));

String makePaymentModelToJson(MakePaymentModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class MakePaymentModel {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "order")
  final Order order;

  MakePaymentModel({
    required this.message,
    required this.order,
  });

  factory MakePaymentModel.fromJson(Map<String, dynamic> json) =>
      _$MakePaymentModelFromJson(json);

  Map<String, dynamic> toJson() => _$MakePaymentModelToJson(this);
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

  Order({
    required this.id,
    required this.userId,
    required this.totalPrice,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
