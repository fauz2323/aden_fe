import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure_core.dart';
import '../../entities/list_category_entities.dart';
import '../../repositories/food_repository.dart';

@Injectable()
class ListCategoryUseCase {
  final FoodRepository foodRepository;

  ListCategoryUseCase({required this.foodRepository});

  Future<Either<Failure, ListCategoryEntities>> call(String token) async {
    return foodRepository.getCategories(token);
  }
}
