import 'package:aden_fe/module/domain/entities/login_entities.dart';
import 'package:aden_fe/module/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure_core.dart';

@Injectable()
class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<Either<Failure, LoginEntity>> login(String email, String password) =>
      authRepository.login(email, password);
}
