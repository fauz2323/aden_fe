import 'package:aden_fe/core/error/failure_core.dart';
import 'package:aden_fe/module/domain/entities/profile_entities.dart';
import 'package:aden_fe/module/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ProfileUsecase {
  final AuthRepository authRepository;

  ProfileUsecase({required this.authRepository});

  Future<Either<Failure, ProfileEntities>> auth(String token) =>
      authRepository.auth(token);
}
