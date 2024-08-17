part of 'food_menu_cubit.dart';

@freezed
class FoodMenuState with _$FoodMenuState {
  const factory FoodMenuState.initial() = _Initial;

  const factory FoodMenuState.loading() = _Loading;

  const factory FoodMenuState.error(String message) = _Error;

  const factory FoodMenuState.loaded(ListFoodEntities foodData) = _Loaded;

  const factory FoodMenuState.unauthorized() = _Unauthorized;
}
