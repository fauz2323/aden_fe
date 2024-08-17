import 'package:aden_fe/module/domain/entities/add_cart_entities.dart';
import 'package:aden_fe/module/domain/entities/user_cart_entities.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure_core.dart';

abstract class OrderRepository {
  Future<Either<Failure, AddCartEntities>> addToCart(
      String token, String uuid, String quantity);
  Future<Either<Failure, UserCartEntities>> getCart(String token);
}
