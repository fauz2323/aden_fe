import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure_core.dart';
import '../../entities/user_cart_entities.dart';
import '../../repositories/order_repository.dart';

@Injectable()
class GetCartUseCase {
  final OrderRepository orderRepository;

  GetCartUseCase(this.orderRepository);

  Future<Either<Failure, UserCartEntities>> call(String token) async {
    return await orderRepository.getCart(token);
  }
}
