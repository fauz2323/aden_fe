part of 'payment_cubit.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState.initial() = _Initial;
  const factory PaymentState.loading() = _Loading;
  const factory PaymentState.error() = _Error;
  const factory PaymentState.loaded(
      GetOrderDetailEntities getOrderDetailEntities) = _Loaded;
  const factory PaymentState.unauthorized() = _Unauthorized;
}
