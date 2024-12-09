import 'package:aden_fe/core/error/failure_core.dart';
import 'package:aden_fe/module/domain/entities/get_all_order_entities.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../repositories/order_repository.dart';

@Injectable()
class GetAllOrderUsecase {
  final OrderRepository _orderRepository;

  GetAllOrderUsecase(this._orderRepository);

  Future<Either<Failure, List<GetAllOrderEntities>>> execute(String token) {
    return _orderRepository.getAllOrder(token);
  }
}
