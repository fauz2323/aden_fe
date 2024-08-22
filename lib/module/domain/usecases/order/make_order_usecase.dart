import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure_core.dart';
import '../../entities/order_entities.dart';
import '../../repositories/order_repository.dart';

@Injectable()
class MakeOrderUsecase {
  final OrderRepository orderRepository;

  MakeOrderUsecase(this.orderRepository);

  Future<Either<Failure, OrderEntitites>> call(String token) async {
    return await orderRepository.makeOrder(token);
  }
}
