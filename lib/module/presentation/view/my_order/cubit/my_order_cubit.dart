import 'package:aden_fe/core/helper/token_helper.dart';
import 'package:aden_fe/module/domain/entities/get_all_order_entities.dart';
import 'package:aden_fe/module/domain/usecases/order/get_all_order_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'my_order_state.dart';
part 'my_order_cubit.freezed.dart';

@injectable
class MyOrderCubit extends Cubit<MyOrderState> {
  MyOrderCubit(this.getAllOrderUsecase) : super(MyOrderState.loading());
  final GetAllOrderUsecase getAllOrderUsecase;
  final TokenHelper tokenHelper = TokenHelper();
  late String token;

  initial() async {
    token = await tokenHelper.getToken();
    final request = await getAllOrderUsecase.execute(token);

    request.fold(
      (l) {
        if (l.code == 401) {
          return emit(MyOrderState.unauthorize());
        }

        emit(MyOrderState.error(l.message));
      },
      (r) => emit(MyOrderState.loaded(r)),
    );
  }
}
