import 'package:aden_fe/module/domain/entities/list_food_entities.dart';
import 'package:aden_fe/module/domain/usecases/food/food_uuid_usecase.dart';
import 'package:aden_fe/module/domain/usecases/order/add_cart_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/helper/token_helper.dart';

part 'food_detail_state.dart';
part 'food_detail_cubit.freezed.dart';

@injectable
class FoodDetailCubit extends Cubit<FoodDetailState> {
  FoodDetailCubit(this.foodUuidUseCase, this.addCartUseCase)
      : super(FoodDetailState.loading());
  final FoodUuidUseCase foodUuidUseCase;
  final AddCartUseCase addCartUseCase;
  late final FoodEntities data;
  late final token;
  int quantity = 1;
  int totalPrice = 0;

  initial(var uuid) async {
    token = await TokenHelper().getToken();
    print(token);

    final request = await foodUuidUseCase.call(token, uuid);

    return request.fold(
      (l) {
        if (l.code == 401) {
          return emit(FoodDetailState.unauthorized());
        }
        emit(FoodDetailState.error(l.message));
      },
      (r) {
        data = r;
        totalPrice = r.price;
        emit(FoodDetailState.loaded(data, quantity, totalPrice));
      },
    );
  }

  incrementQuantity() {
    quantity++;
    totalPrice += data.price;
    emit(FoodDetailState.loaded(data, quantity, totalPrice));
  }

  decrementQuantity() {
    if (quantity > 1) {
      quantity--;
      totalPrice -= data.price;
      emit(FoodDetailState.loaded(data, quantity, totalPrice));
    }
  }

  addCart() async {
    emit(FoodDetailState.loading());
    final request =
        await addCartUseCase.call(token, data.uuid, quantity.toString());

    emit(FoodDetailState.loaded(data, quantity, totalPrice));
    return request.fold(
      (l) => l.message,
      (r) => r.message,
    );
  }
}
