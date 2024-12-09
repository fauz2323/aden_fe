import 'package:aden_fe/module/domain/entities/list_food_entities.dart';
import 'package:aden_fe/module/domain/usecases/food/food_by_category_usecase.dart';
import 'package:aden_fe/module/domain/usecases/food/list_food_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/helper/token_helper.dart';

part 'food_menu_state.dart';
part 'food_menu_cubit.freezed.dart';

@injectable
class FoodMenuCubit extends Cubit<FoodMenuState> {
  FoodMenuCubit(
    this.listFoodUseCase,
    this.listFoodByCategoryUseCase,
  ) : super(FoodMenuState.loading());
  final ListFoodUseCase listFoodUseCase;
  final ListFoodByCategoryUseCase listFoodByCategoryUseCase;

  late final token;

  initial(String category) async {
    token = await TokenHelper().getToken();
    var request;

    if (category == '-') {
      request = await listFoodUseCase.call(token);
    } else {
      request = await listFoodByCategoryUseCase.call(token, category);
    }

    request.fold(
      (l) {
        if (l.code == 401) {
          return emit(FoodMenuState.unauthorized());
        }

        emit(FoodMenuState.error(l.message));
      },
      (r) => emit(FoodMenuState.loaded(r)),
    );
  }
}
