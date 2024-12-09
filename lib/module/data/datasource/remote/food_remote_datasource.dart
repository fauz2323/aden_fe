import 'dart:convert';

import 'package:aden_fe/core/error/failure_core.dart';
import 'package:aden_fe/core/helper/api_helper.dart';
import 'package:aden_fe/module/data/model/food_uuid_model.dart';
import 'package:aden_fe/module/data/model/list_category_model.dart';
import 'package:aden_fe/module/data/model/list_food_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

abstract class FoodRemoteDataSource {
  Future<Either<Failure, ListCategoryModel>> getCategory(String token);
  Future<Either<Failure, ListFoodModel>> getFood(String token);
  Future<Either<Failure, ListFoodModel>> getFoodByCategory(
      String token, String category);
  Future<Either<Failure, FoodUuidModel>> getFoodByUuid(
      String token, String uuid);
}

@Injectable()
class FoodRemoteDataSourceImpl implements FoodRemoteDataSource {
  @override
  Future<Either<Failure, ListCategoryModel>> getCategory(String token) async {
    final request = await http
        .get(
          ApiHelper.getCategory,
          headers: ApiHelper.getHeaderGet(token),
        )
        .timeout(
          Duration(seconds: 10),
          onTimeout: () => ApiHelper.timeOutException(),
        );
    print(request.statusCode);

    print(request.body);

    if (request.statusCode != 200) {
      return Left(
        Failure(
          message: '-',
          code: request.statusCode,
        ),
      );
    }

    return Right(ListCategoryModel.fromJson(jsonDecode(request.body)));
  }

  @override
  Future<Either<Failure, ListFoodModel>> getFood(String token) async {
    final request = await http
        .get(
          ApiHelper.getFood,
          headers: ApiHelper.getHeaderGet(token),
        )
        .timeout(
          Duration(seconds: 10),
          onTimeout: () => ApiHelper.timeOutException(),
        );

    print(request.statusCode);

    if (request.statusCode != 200) {
      return Left(
        Failure(
          message: '-',
          code: request.statusCode,
        ),
      );
    }

    return Right(ListFoodModel.fromJson(jsonDecode(request.body)));
  }

  @override
  Future<Either<Failure, FoodUuidModel>> getFoodByUuid(
      String token, String uuid) async {
    Map body = {'uuid': uuid};

    final request = await http
        .post(
          ApiHelper.getFoodUuid,
          body: body,
          headers: ApiHelper.getHeaderPost(token),
        )
        .timeout(
          Duration(seconds: 10),
          onTimeout: () => ApiHelper.timeOutException(),
        );

    print(request.statusCode);

    if (request.statusCode != 200) {
      return Left(
        Failure(
          message: '-',
          code: request.statusCode,
        ),
      );
    }

    return Right(FoodUuidModel.fromJson(jsonDecode(request.body)));
  }

  @override
  Future<Either<Failure, ListFoodModel>> getFoodByCategory(
      String token, String category) async {
    Map body = {
      'category': category,
    };
    final request = await http
        .post(
          ApiHelper.getFoodByCategory,
          body: body,
          headers: ApiHelper.getHeaderPost(token),
        )
        .timeout(
          Duration(seconds: 10),
          onTimeout: () => ApiHelper.timeOutException(),
        );

    print(request.statusCode);

    if (request.statusCode != 200) {
      return Left(
        Failure(
          message: '-',
          code: request.statusCode,
        ),
      );
    }

    return Right(ListFoodModel.fromJson(jsonDecode(request.body)));
  }
}
