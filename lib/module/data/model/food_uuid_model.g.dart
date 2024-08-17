// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_uuid_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodUuidModel _$FoodUuidModelFromJson(Map<String, dynamic> json) =>
    FoodUuidModel(
      message: json['message'] as String,
      food: Food.fromJson(json['food'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FoodUuidModelToJson(FoodUuidModel instance) =>
    <String, dynamic>{
      'message': instance.message,
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
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
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
      'category': instance.category,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      icon: json['icon'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'icon': instance.icon,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
