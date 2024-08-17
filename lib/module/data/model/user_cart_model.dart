// To parse this JSON data, do
//
//     final userCartModel = userCartModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user_cart_model.g.dart';

UserCartModel userCartModelFromJson(String str) => UserCartModel.fromJson(json.decode(str));

String userCartModelToJson(UserCartModel data) => json.encode(data.toJson());

@JsonSerializable()
class UserCartModel {
    @JsonKey(name: "message")
    final String message;
    @JsonKey(name: "cart")
    final List<Cart> cart;

    UserCartModel({
        required this.message,
        required this.cart,
    });

    factory UserCartModel.fromJson(Map<String, dynamic> json) => _$UserCartModelFromJson(json);

    Map<String, dynamic> toJson() => _$UserCartModelToJson(this);
}

@JsonSerializable()
class Cart {
    @JsonKey(name: "id")
    final int id;
    @JsonKey(name: "user_id")
    final int userId;
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

    Cart({
        required this.id,
        required this.userId,
        required this.foodId,
        required this.quantity,
        required this.price,
        required this.createdAt,
        required this.updatedAt,
        required this.food,
    });

    factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

    Map<String, dynamic> toJson() => _$CartToJson(this);
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
