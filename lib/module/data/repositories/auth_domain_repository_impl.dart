import 'package:aden_fe/core/error/failure_core.dart';
import 'package:aden_fe/module/data/datasource/remote/auth_remote_datasource.dart';
import 'package:aden_fe/module/domain/entities/login_entities.dart';
import 'package:aden_fe/module/domain/entities/profile_entities.dart';
import 'package:aden_fe/module/domain/entities/register_entities.dart';
import 'package:aden_fe/module/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthDomainRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasourceImpl authRemoteDatasourceImpl;

  AuthDomainRepositoryImpl({required this.authRemoteDatasourceImpl});

  @override
  Future<Either<Failure, LoginEntity>> login(
      String email, String password) async {
    final data = await authRemoteDatasourceImpl.login(email, password);

    return data.fold(
      (l) => Left(l),
      (r) => Right(
        r.toEntity(),
      ),
    );
  }

  @override
  Future<Either<Failure, RegisterEntity>> register(
      String name, String email, String phone, String password) async {
    final data =
        await authRemoteDatasourceImpl.register(name, email, phone, password);

    return data.fold(
      (l) => Left(l),
      (r) => Right(
        r.toEntity(),
      ),
    );
  }

  @override
  Future<Either<Failure, ProfileEntities>> auth(String token) async {
    final data = await authRemoteDatasourceImpl.auth(token);

    return data.fold(
      (l) => Left(l),
      (r) => Right(
        ProfileEntities(
          name: r.user.name,
          email: r.user.email,
          phone: r.user.phone,
          type: r.user.type,
        ),
      ),
    );
  }
}
