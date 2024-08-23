import 'package:aden_fe/module/domain/entities/get_order_Detail_entities.dart';
import 'package:aden_fe/module/domain/usecases/order/get_detail_order_usecase.dart';
import 'package:aden_fe/module/domain/usecases/order/make_payment_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/helper/token_helper.dart';

part 'payment_state.dart';
part 'payment_cubit.freezed.dart';

@injectable
class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.getDetailOrderUseCase, this.makePaymentUsecase)
      : super(PaymentState.initial());
  final GetDetailOrderUseCase getDetailOrderUseCase;
  final MakePaymentUsecase makePaymentUsecase;
  late String token;

  initial(String id) async {
    emit(PaymentState.loading());
    token = await TokenHelper().getToken();
    final result = await getDetailOrderUseCase.call(token, id);
  }
}
