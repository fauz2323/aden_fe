import 'package:aden_fe/module/domain/entities/add_cart_entities.dart';
import 'package:aden_fe/module/domain/entities/get_all_order_entities.dart';
import 'package:aden_fe/module/domain/entities/get_order_Detail_entities.dart';
import 'package:aden_fe/module/domain/entities/make_payment_entities.dart';
import 'package:aden_fe/module/domain/entities/order_entities.dart';
import 'package:aden_fe/module/domain/entities/user_cart_entities.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure_core.dart';

abstract class OrderRepository {
  Future<Either<Failure, AddCartEntities>> addToCart(
      String token, String uuid, String quantity);
  Future<Either<Failure, UserCartEntities>> getCart(String token);
  Future<Either<Failure, OrderEntitites>> makeOrder(String token);
  Future<Either<Failure, GetOrderDetailEntities>> getDetailOrder(
      String token, String id);
  Future<Either<Failure, MakePaymentEntities>> makePayment(String token);
  Future<Either<Failure, List<GetAllOrderEntities>>> getAllOrder(String token);
}
