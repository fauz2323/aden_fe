part of 'food_detail_cubit.dart';

@freezed
class FoodDetailState with _$FoodDetailState {
  const factory FoodDetailState.initial() = _Initial;
  const factory FoodDetailState.loading() = _Loading;
  const factory FoodDetailState.error(String message) = _Error;
  const factory FoodDetailState.loaded(
      FoodEntities data, int quantity, int price) = _Loaded;
  const factory FoodDetailState.unauthorized() = _Unauthorized;
}
