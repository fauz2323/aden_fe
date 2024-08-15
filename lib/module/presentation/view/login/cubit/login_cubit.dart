import 'package:aden_fe/module/domain/usecases/auth/login_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginState.initial());

  final LoginUseCase loginUseCase;

  login(String email, String password) async {
    emit(LoginState.loading());

    final request = await loginUseCase.login(email, password);

    request.fold(
      (l) => null,
      (r) => emit(LoginState.loaded(r.token)),
    );
  }
}
