part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.loaded(ProfileEntities profile) = _Loaded;
  const factory ProfileState.error(String message) = _Error;
  const factory ProfileState.unauthorize() = _Unauthorize;
}
