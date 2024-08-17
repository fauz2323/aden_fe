part of 'home_screen_cubit.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState.initial() = _Initial;
  const factory HomeScreenState.loading() = _Loading;
  const factory HomeScreenState.error(String message) = _Error;
  const factory HomeScreenState.loaded(
      ListFoodEntities foodData, ListCategoryEntities catData) = _Loaded;
  const factory HomeScreenState.unauthorized() = _Unauthorized;
}
