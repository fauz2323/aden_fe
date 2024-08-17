import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure_core.dart';
import '../../entities/add_cart_entities.dart';
import '../../repositories/order_repository.dart';

@Injectable()
class AddCartUseCase {
  final OrderRepository orderRepository;

  AddCartUseCase({required this.orderRepository});

  Future<Either<Failure, AddCartEntities>> call(
      String token, String uuid, String quantity) async {
    return await orderRepository.addToCart(token, uuid, quantity);
  }
}
