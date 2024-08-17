// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCartModel _$UserCartModelFromJson(Map<String, dynamic> json) =>
    UserCartModel(
      message: json['message'] as String,
      cart: (json['cart'] as List<dynamic>)
          .map((e) => Cart.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserCartModelToJson(UserCartModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'cart': instance.cart,
    };

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      foodId: (json['food_id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      food: Food.fromJson(json['food'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
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
