// To parse this JSON data, do
//
//     final listCategoryModel = listCategoryModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'list_category_model.g.dart';

ListCategoryModel listCategoryModelFromJson(String str) =>
    ListCategoryModel.fromJson(json.decode(str));

String listCategoryModelToJson(ListCategoryModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ListCategoryModel {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "types")
  final List<Type> types;

  ListCategoryModel({
    required this.message,
    required this.types,
  });

  factory ListCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ListCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListCategoryModelToJson(this);
}

@JsonSerializable()
class Type {
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

  Type({
    required this.id,
    required this.name,
    required this.slug,
    required this.icon,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);
}
