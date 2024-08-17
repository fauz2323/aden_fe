import 'package:aden_fe/module/domain/entities/user_cart_entities.dart';
import 'package:aden_fe/module/domain/usecases/order/get_cart_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/helper/token_helper.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit(this.getCartUseCase) : super(CartState.initial());
  final GetCartUseCase getCartUseCase;
  int total = 0;
  late final token;

  initial() async {
    emit(CartState.loading());
    token = await TokenHelper().getToken();

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
        r.items.map((e) => total += e.price).toList();
        emit(CartState.loaded(r, total));
      },
    );
  }
}
