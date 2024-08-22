part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = _Loading;
  const factory CartState.error(String message) = _Error;
  const factory CartState.loaded(UserCartEntities userCart, int total) =
      _Loaded;
  const factory CartState.unauthorized() = _Unauthorized;
  const factory CartState.payment() = _Payment;
}
