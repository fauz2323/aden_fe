import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure_core.dart';
import '../../entities/register_entities.dart';
import '../../repositories/auth_repository.dart';

@Injectable()
class RegisterUseCase {
  final AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<Failure, RegisterEntity>> register(
          String name, String email, String phone, String password) =>
      authRepository.register(name, email, phone, password);
}
