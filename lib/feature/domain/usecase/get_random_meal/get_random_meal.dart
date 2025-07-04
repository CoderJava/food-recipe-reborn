import 'package:food_recipe/core/error/failure.dart';
import 'package:food_recipe/core/usecase/usecase.dart';
import 'package:food_recipe/feature/data/model/meal/meal_response.dart';
import 'package:food_recipe/feature/domain/repository/the_meal_db/the_meal_db_repository.dart';

class GetRandomMeal implements UseCase<MealResponse, NoParams> {
  final TheMealDbRepository repository;

  GetRandomMeal({required this.repository});

  @override
  Future<({Failure? failure, MealResponse? response})> call(NoParams params) {
    return repository.getRandomMeal();
  }
}