// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'profile_model.g.dart';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

@JsonSerializable()
class ProfileModel {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "user")
  final User user;

  ProfileModel({
    required this.message,
    required this.user,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "phone")
  final String phone;
  @JsonKey(name: "email_verified_at")
  final dynamic emailVerifiedAt;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.emailVerifiedAt,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
