// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_detail_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDetailOrderModel _$GetDetailOrderModelFromJson(Map<String, dynamic> json) =>
    GetDetailOrderModel(
      message: json['message'] as String,
      order: Order.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetDetailOrderModelToJson(
        GetDetailOrderModel instance) =>
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
      orderList: (json['order_list'] as List<dynamic>)
          .map((e) => OrderList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'total_price': instance.totalPrice,
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'order_list': instance.orderList,
    };

OrderList _$OrderListFromJson(Map<String, dynamic> json) => OrderList(
      id: (json['id'] as num).toInt(),
      userOrderId: (json['user_order_id'] as num).toInt(),
      foodId: (json['food_id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$OrderListToJson(OrderList instance) => <String, dynamic>{
      'id': instance.id,
      'user_order_id': instance.userOrderId,
      'food_id': instance.foodId,
      'quantity': instance.quantity,
      'price': instance.price,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
