import 'package:aden_fe/module/domain/entities/list_food_entities.dart';
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
  ) : super(FoodMenuState.loading());
  final ListFoodUseCase listFoodUseCase;

  late final token;

  initial() async {
    token = await TokenHelper().getToken();

    final request = await listFoodUseCase.call(token);

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
