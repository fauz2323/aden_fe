part of 'my_order_cubit.dart';

@freezed
class MyOrderState with _$MyOrderState {
  const factory MyOrderState.initial() = _Initial;
  const factory MyOrderState.loading() = _Loading;
  const factory MyOrderState.loaded(List<GetAllOrderEntities> data) = _Loaded;
  const factory MyOrderState.error(String message) = _Error;
  const factory MyOrderState.unauthorize() = _Unauthorize;
}
