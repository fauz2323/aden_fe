import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure_core.dart';
import '../../entities/list_food_entities.dart';
import '../../repositories/food_repository.dart';

@Injectable()
class FoodUuidUseCase {
  final FoodRepository foodRepository;

  FoodUuidUseCase({required this.foodRepository});

  Future<Either<Failure, FoodEntities>> call(String token, String uuid) async {
    return foodRepository.getFoodsUuid(token, uuid);
  }
}
