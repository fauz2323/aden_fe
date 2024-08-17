import 'dart:convert';

import 'package:aden_fe/core/error/failure_core.dart';
import 'package:aden_fe/module/data/model/add_cart_model.dart';
import 'package:aden_fe/module/data/model/user_cart_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

import '../../../../core/helper/api_helper.dart';

abstract class OrderRemoteDatasource {
  Future<Either<Failure, AddCartModel>> addToCart(
      String token, String uuid, String quantity);
  Future<Either<Failure, UserCartModel>> getCart(String token);
}

@Injectable()
class OrderRemoteDatasourceImpl implements OrderRemoteDatasource {
  @override
  Future<Either<Failure, AddCartModel>> addToCart(
      String token, String uuid, String quantity) async {
    Map body = {
      'uuid': uuid,
      'quantity': quantity,
    };

    final request = await http
        .post(
          ApiHelper.addToCart,
          body: body,
          headers: ApiHelper.getHeaderPost(token),
        )
        .timeout(
          Duration(seconds: 10),
          onTimeout: () => ApiHelper.timeOutException(),
        );

    if (request.statusCode != 200) {
      return left(
        Failure(
          message: jsonDecode(request.body)['message'],
          code: request.statusCode,
        ),
      );
    }

    return right(AddCartModel.fromJson(jsonDecode(request.body)));
  }

  @override
  Future<Either<Failure, UserCartModel>> getCart(String token) async {
    final request = await http
        .get(
          ApiHelper.getCart,
          headers: ApiHelper.getHeaderGet(token),
        )
        .timeout(
          Duration(seconds: 10),
          onTimeout: () => ApiHelper.timeOutException(),
        );

    if (request.statusCode != 200) {
      return left(
        Failure(
          message: jsonDecode(request.body)['message'],
          code: request.statusCode,
        ),
      );
    }

    return right(UserCartModel.fromJson(jsonDecode(request.body)));
  }
}