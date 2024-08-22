// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'make_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakePaymentModel _$MakePaymentModelFromJson(Map<String, dynamic> json) =>
    MakePaymentModel(
      message: json['message'] as String,
      order: Order.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MakePaymentModelToJson(MakePaymentModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'order': instance.order,
    };

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      totalPrice: (json['total_price'] as num).toInt(),
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'total_price': instance.totalPrice,
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
