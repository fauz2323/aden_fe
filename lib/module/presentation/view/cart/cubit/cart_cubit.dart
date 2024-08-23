import 'dart:ffi';

import 'package:aden_fe/module/domain/entities/user_cart_entities.dart';
import 'package:aden_fe/module/domain/usecases/order/get_cart_usecase.dart';
import 'package:aden_fe/module/domain/usecases/order/make_order_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/helper/token_helper.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit(this.getCartUseCase, this.makeOrderUsecase)
      : super(CartState.initial());
  final GetCartUseCase getCartUseCase;
  final MakeOrderUsecase makeOrderUsecase;
  late UserCartEntities userCart;
  int total = 0;
  late final token;

  initial() async {
    emit(CartState.loading());
    token = await TokenHelper().getToken();
    print(token);

    final result = await getCartUseCase.call(token);

    result.fold(
      (l) {
        print(l.code);
        if (l.code == 401) {
          emit(CartState.unauthorized());
        }
        emit(CartState.error(l.message));
      },
      (r) {
        r.items.map((e) => total += e.total).toList();
        userCart = r;
        emit(CartState.loaded(userCart, total));
      },
    );
  }

  Future<List> makeOrder() async {
    emit(CartState.loading());
    final result = await makeOrderUsecase.call(token);
    return result.fold(
      (l) {
        print(l.code);
        if (l.code == 401) {
          emit(CartState.unauthorized());
          return {"message": l.message, "code": l.code};
        }
        emit(CartState.loaded(userCart, total));
        return {"message": l.message, "code": l.code};
      },
      (r) {
        emit(CartState.payment());
        return {"message": r.message, "code": r.};
      },
    );
  }
}
