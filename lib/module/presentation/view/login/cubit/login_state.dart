part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;

  const factory LoginState.loading() = _Loading;

  const factory LoginState.error(String message) = _Error;

  const factory LoginState.loaded(String token) = _Loaded;
}
