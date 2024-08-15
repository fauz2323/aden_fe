import 'package:aden_fe/core/error/failure_core.dart';
import 'package:aden_fe/module/domain/entities/login_entities.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity>> login(String email, String password);
  Future<Either<Failure, String>> register(
      String name, String email, String phone, String password);
}
