import 'package:aden_fe/module/domain/entities/get_order_Detail_entities.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure_core.dart';
import '../../repositories/order_repository.dart';

@Injectable()
class GetDetailOrderUseCase {
  final OrderRepository orderRepository;

  GetDetailOrderUseCase(this.orderRepository);

  Future<Either<Failure, GetOrderDetailEntities>> call(
      String token, String id) async {
    return await orderRepository.getDetailOrder(token, id);
  }
}
