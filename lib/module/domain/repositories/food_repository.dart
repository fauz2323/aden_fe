import 'package:aden_fe/core/error/failure_core.dart';
import 'package:aden_fe/module/domain/entities/list_category_entities.dart';
import 'package:aden_fe/module/domain/entities/list_food_entities.dart';
import 'package:dartz/dartz.dart';

abstract class FoodRepository {
  Future<Either<Failure, ListCategoryEntities>> getCategories(String token);
  Future<Either<Failure, ListFoodEntities>> getFoods(String token);
  Future<Either<Failure, FoodEntities>> getFoodsUuid(String token, String Uuid);
}
