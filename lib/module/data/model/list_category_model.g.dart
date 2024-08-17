// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCategoryModel _$ListCategoryModelFromJson(Map<String, dynamic> json) =>
    ListCategoryModel(
      message: json['message'] as String,
      types: (json['types'] as List<dynamic>)
          .map((e) => Type.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListCategoryModelToJson(ListCategoryModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'types': instance.types,
    };

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      icon: json['icon'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'icon': instance.icon,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
