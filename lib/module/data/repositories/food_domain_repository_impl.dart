import 'package:aden_fe/core/error/failure_core.dart';
import 'package:aden_fe/module/data/datasource/remote/food_remote_datasource.dart';
import 'package:aden_fe/module/domain/entities/list_category_entities.dart';
import 'package:aden_fe/module/domain/entities/list_food_entities.dart';
import 'package:aden_fe/module/domain/repositories/food_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FoodRepository)
class FoodDomainRepositoryImpl implements FoodRepository {
  final FoodRemoteDataSourceImpl foodRemoteDataSourceImpl;

  FoodDomainRepositoryImpl({required this.foodRemoteDataSourceImpl});
  @override
  Future<Either<Failure, ListCategoryEntities>> getCategories(
      String token) async {
    final data = await foodRemoteDataSourceImpl.getCategory(token);
    return data.fold(
      (l) => Left(l),
      (r) {
        ListCategoryEntities dataList = ListCategoryEntities(
          message: r.message,
          listCategoryEntities: r.types
              .map(
                (e) => CategoryEntities(
                  id: e.id,
                  name: e.name,
                  slug: e.slug,
                  icon: e.icon,
                  date: e.createdAt,
                ),
              )
              .toList(),
        );

        return Right(dataList);
      },
    );
  }

  @override
  Future<Either<Failure, ListFoodEntities>> getFoods(String token) async {
    final data = await foodRemoteDataSourceImpl.getFood(token);
    return data.fold((l) => Left(l), (r) {
      ListFoodEntities toEntities() => ListFoodEntities(
            message: r.message,
            listFood: r.foods
                .map(
                  (e) => FoodEntities(
                    name: e.name,
                    uuid: e.uuid,
                    price: e.price,
                    description: e.description,
                    status: e.status,
                    stock: e.stock,
                    date: e.createdAt,
                    image: e.image,
                    category: e.category.name,
                    categorySlug: e.category.slug,
                  ),
                )
                .toList(),
          );

      return Right(toEntities());
    });
  }

  @override
  Future<Either<Failure, FoodEntities>> getFoodsUuid(
      String token, String uuid) async {
    final data = await foodRemoteDataSourceImpl.getFoodByUuid(token, uuid);
    return data.fold(
      (l) => Left(l),
      (r) {
        return Right(
          FoodEntities(
            name: r.food.name,
            uuid: r.food.uuid,
            price: r.food.price,
            description: r.food.description,
            status: r.food.status,
            stock: r.food.stock,
            date: r.food.createdAt,
            image: r.food.image,
            category: r.food.category.name,
            categorySlug: r.food.category.slug,
          ),
        );
      },
    );
  }
}
