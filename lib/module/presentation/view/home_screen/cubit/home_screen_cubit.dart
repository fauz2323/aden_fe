import 'package:aden_fe/module/domain/entities/list_category_entities.dart';
import 'package:aden_fe/module/domain/entities/list_food_entities.dart';
import 'package:aden_fe/module/domain/usecases/food/list_category_usecase.dart';
import 'package:aden_fe/module/domain/usecases/food/list_food_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/helper/token_helper.dart';

part 'home_screen_state.dart';
part 'home_screen_cubit.freezed.dart';

@injectable
class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit(
    this.listCategoryUseCase,
    this.listFoodUseCase,
  ) : super(HomeScreenState.initial());

  final ListCategoryUseCase listCategoryUseCase;
  final ListFoodUseCase listFoodUseCase;

  late ListCategoryEntities listCategory;

  late ListFoodEntities listFood;

  late final token;

  initial() async {
    emit(HomeScreenState.loading());
    token = await TokenHelper().getToken();

    final request1 = await listCategoryUseCase.call(token);

    request1.fold(
      (l) => emit(HomeScreenState.error(l.message)),
      (r) async {
        final request2 = await listFoodUseCase.call(token);

        listCategory = r;

        request2.fold(
          (l) {
            if (l.code == 401) {
              return emit(HomeScreenState.unauthorized());
            }

            emit(HomeScreenState.error(l.message));
          },
          (r) async {
            listFood = r;
            emit(HomeScreenState.loaded(listFood, listCategory));
          },
        );
      },
    );
  }
}
