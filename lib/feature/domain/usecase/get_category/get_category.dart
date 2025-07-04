import 'package:food_recipe/core/error/failure.dart';
import 'package:food_recipe/core/usecase/usecase.dart';
import 'package:food_recipe/feature/data/model/category/category_response.dart';
import 'package:food_recipe/feature/domain/repository/the_meal_db/the_meal_db_repository.dart';

class GetCategory implements UseCase<CategoryResponse, NoParams> {
  final TheMealDbRepository repository;

  GetCategory({required this.repository});

  @override
  Future<({Failure? failure, CategoryResponse? response})> call(NoParams params) {
    return repository.getCategory();
  }
}