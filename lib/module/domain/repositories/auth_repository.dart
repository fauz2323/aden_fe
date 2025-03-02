import 'package:aden_fe/core/error/failure_core.dart';
import 'package:aden_fe/module/domain/entities/login_entities.dart';
import 'package:aden_fe/module/domain/entities/profile_entities.dart';
import 'package:aden_fe/module/domain/entities/register_entities.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity>> login(String email, String password);
  Future<Either<Failure, ProfileEntities>> auth(String token);
  Future<Either<Failure, RegisterEntity>> register(
      String name, String email, String phone, String password);
}
