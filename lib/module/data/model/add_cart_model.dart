// To parse this JSON data, do
//
//     final addCartModel = addCartModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'add_cart_model.g.dart';

AddCartModel addCartModelFromJson(String str) =>
    AddCartModel.fromJson(json.decode(str));

String addCartModelToJson(AddCartModel data) => json.encode(data.toJson());

@JsonSerializable()
class AddCartModel {
  @JsonKey(name: "message")
  final String message;

  AddCartModel({
    required this.message,
  });

  factory AddCartModel.fromJson(Map<String, dynamic> json) =>
      _$AddCartModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddCartModelToJson(this);
}
