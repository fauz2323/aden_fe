import 'package:aden_fe/module/domain/entities/make_payment_entities.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure_core.dart';
import '../../repositories/order_repository.dart';

@Injectable()
class MakePaymentUsecase {
  final OrderRepository orderRepository;

  MakePaymentUsecase(this.orderRepository);

  Future<Either<Failure, MakePaymentEntities>> call(String token) async {
    return await orderRepository.makePayment(token);
  }
}
