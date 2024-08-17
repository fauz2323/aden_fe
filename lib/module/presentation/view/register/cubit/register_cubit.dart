import 'package:aden_fe/module/domain/usecases/auth/register_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(
    this.registerUseCase,
  ) : super(RegisterState.initial());
  final RegisterUseCase registerUseCase;

  Future<String> register(
      String email, String password, String name, String phone) async {
    emit(RegisterState.loading());

    final request =
        await registerUseCase.register(name, email, phone, password);

    return request.fold(
      (l) {
        emit(RegisterState.initial());
        return l.message;
      },
      (r) {
        emit(RegisterState.loaded(r.token));

        return r.message;
      },
    );
  }
}
