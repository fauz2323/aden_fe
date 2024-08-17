import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure_core.dart';
import '../../entities/list_food_entities.dart';
import '../../repositories/food_repository.dart';

@Injectable()
class ListFoodUseCase {
  final FoodRepository foodRepository;

  ListFoodUseCase({required this.foodRepository});

  Future<Either<Failure, ListFoodEntities>> call(String token) async {
    return foodRepository.getFoods(token);
  }
}
