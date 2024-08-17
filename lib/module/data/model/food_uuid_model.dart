// To parse this JSON data, do
//
//     final foodUuidModel = foodUuidModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'food_uuid_model.g.dart';

FoodUuidModel foodUuidModelFromJson(String str) =>
    FoodUuidModel.fromJson(json.decode(str));

String foodUuidModelToJson(FoodUuidModel data) => json.encode(data.toJson());

@JsonSerializable()
class FoodUuidModel {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "food")
  final Food food;

  FoodUuidModel({
    required this.message,
    required this.food,
  });

  factory FoodUuidModel.fromJson(Map<String, dynamic> json) =>
      _$FoodUuidModelFromJson(json);

  Map<String, dynamic> toJson() => _$FoodUuidModelToJson(this);
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
  @JsonKey(name: "category")
  final Category category;

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
    required this.category,
  });

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);

  Map<String, dynamic> toJson() => _$FoodToJson(this);
}

@JsonSerializable()
class Category {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "slug")
  final String slug;
  @JsonKey(name: "icon")
  final String icon;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.icon,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}