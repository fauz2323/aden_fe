import 'package:aden_fe/core/error/failure_core.dart';
import 'package:aden_fe/module/data/datasource/remote/order_remote_datasource.dart';
import 'package:aden_fe/module/domain/entities/add_cart_entities.dart';
import 'package:aden_fe/module/domain/entities/order_entities.dart';
import 'package:aden_fe/module/domain/entities/user_cart_entities.dart';
import 'package:aden_fe/module/domain/repositories/order_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OrderRepository)
class OrderDomainRepositoryImpl implements OrderRepository {
  final OrderRemoteDatasourceImpl orderRemoteDatasource;
  OrderDomainRepositoryImpl({required this.orderRemoteDatasource});
  @override
  Future<Either<Failure, AddCartEntities>> addToCart(
      String token, String uuid, String quantity) async {
    final result = await orderRemoteDatasource.addToCart(token, uuid, quantity);
    return result.fold(
      (l) => Left(l),
      (r) => Right(AddCartEntities(message: r.message)),
    );
  }

  @override
  Future<Either<Failure, UserCartEntities>> getCart(String token) async {
    final result = await orderRemoteDatasource.getCart(token);
    return result.fold(
      (l) => Left(l),
      (r) {
        UserCartEntities userCartEntities = UserCartEntities(
          message: r.message,
          items: r.cart
              .map(
                (e) => UserCartItemsEntities(
                  image: e.food.image,
                  name: e.food.name,
                  price: e.food.price,
                  quantity: e.quantity,
                  uuid: e.food.uuid,
                  total: e.price,
                ),
              )
              .toList(),
        );

        return Right(userCartEntities);
      },
    );
  }

  @override
  Future<Either<Failure, OrderEntitites>> makeOrder(String token) async {
    final result = await orderRemoteDatasource.makeOrder(token);
    return result.fold(
      (l) => Left(l),
      (r) {
        OrderEntitites orderEntitites = OrderEntitites(
            date: r.order.createdAt,
            message: r.message,
            total: r.order.totalPrice,
            status: r.order.status);

        return Right(orderEntitites);
      },
    );
  }
}
