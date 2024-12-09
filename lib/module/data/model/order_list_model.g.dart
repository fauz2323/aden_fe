// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderListModel _$OrderListModelFromJson(Map<String, dynamic> json) =>
    OrderListModel(
      message: json['message'] as String,
      orders: (json['orders'] as List<dynamic>)
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderListModelToJson(OrderListModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'orders': instance.orders,
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
      food: Food.fromJson(json['food'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderListToJson(OrderList instance) => <String, dynamic>{
      'id': instance.id,
      'user_order_id': instance.userOrderId,
      'food_id': instance.foodId,
      'quantity': instance.quantity,
      'price': instance.price,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'food': instance.food,
    };

Food _$FoodFromJson(Map<String, dynamic> json) => Food(
      id: (json['id'] as num).toInt(),
      categoryId: (json['category_id'] as num).toInt(),
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toInt(),
      description: json['description'] as String,
      image: json['image'] as String,
      status: json['status'] as String,
      stock: json['stock'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$FoodToJson(Food instance) => <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'uuid': instance.uuid,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'image': instance.image,
      'status': instance.status,
      'stock': instance.stock,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
